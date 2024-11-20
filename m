Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FCCD711D1
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA40610E2D5;
	Wed, 20 Nov 2024 17:51:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A800F10E2D5;
 Wed, 20 Nov 2024 17:51:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/igt=5Fkms=3A_Clear_all?=
 =?utf-8?q?_pipe_properties_on_reset_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 Nov 2024 17:51:54 -0000
Message-ID: <173212511470.802975.17999542325648726847@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118141522.2046021-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20241118141522.2046021-1-bhanuprakash.modem@intel.com>
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

Series: lib/igt_kms: Clear all pipe properties on reset (rev3)
URL   : https://patchwork.freedesktop.org/series/141498/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12145_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12145_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12145_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12145_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-6-pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-6-pipe-b-dp-4.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +8 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-cm-shared-vm-basic:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] +3 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_exec_threads@threads-cm-shared-vm-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_exec_threads@threads-cm-shared-vm-basic.html

  * igt@xe_vm@munmap-style-unbind-userptr-end:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_vm@munmap-style-unbind-userptr-end.html

  
#### Warnings ####

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_display_modes@extended-mode-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html

  * igt@xe_dma_buf_sync@export-dma-buf-many-read-sync:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1130]) -> [DMESG-WARN][12] +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_dma_buf_sync@export-dma-buf-many-read-sync.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_dma_buf_sync@export-dma-buf-many-read-sync.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][13] ([Intel XE#1130]) -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][15] ([Intel XE#3467]) -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [FAIL][17] ([Intel XE#2136]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12145_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][19] -> [SKIP][20] ([Intel XE#2423])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@core_getclient.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@core_getclient.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#3440])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#3130] / [Intel XE#3249])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#2134]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@fbdev@write.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2550]) +23 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#3279])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#1426]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1407])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#2136]) +31 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2327]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][34] -> [DMESG-FAIL][35] ([Intel XE#3468]) +13 other tests dmesg-fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#316]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1124]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2191]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#787]) +146 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2887]) +10 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#3433]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1152]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2325])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2252]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#373])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#3278])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#307])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1178])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2341])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][59] ([Intel XE#3468]) +9 other tests dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2320]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2321])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#2423] / [i915#2575]) +94 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2321])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1424]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-edp-1:
    - shard-lnl:          [PASS][66] -> [DMESG-WARN][67] ([Intel XE#3466]) +25 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-edp-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2291])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2291]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#309]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][72] -> [DMESG-WARN][73] ([Intel XE#877])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1508])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([i915#3804])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#3070])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2244]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1138])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#3486])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#3321] / [Intel XE#3487])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#2882]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1421]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [FAIL][88] ([Intel XE#886]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][89] ([Intel XE#301]) +5 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#3486])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#301] / [Intel XE#3486])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1397] / [Intel XE#1745])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1397])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2380]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1401]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#651])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#651]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2136]) +31 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2312]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2311]) +10 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][105] ([Intel XE#3468]) +4 other tests dmesg-fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][106] ([Intel XE#2333]) +5 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#656]) +21 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2352])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2313]) +15 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1503])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][112] -> [DMESG-WARN][113] ([Intel XE#3468]) +2 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2423] / [i915#2575]) +35 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#361])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2763]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-lnl:          [PASS][117] -> [DMESG-WARN][118] ([Intel XE#2566] / [Intel XE#3466]) +1 other test dmesg-warn
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2763]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2763]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2-set2:     [PASS][122] -> [DMESG-WARN][123] ([Intel XE#2566])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][124] ([Intel XE#3527])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [PASS][125] -> [DMESG-WARN][126] ([Intel XE#1727] / [Intel XE#3468])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1439] / [Intel XE#3141])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][128] -> [SKIP][129] ([Intel XE#2446]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2893]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1489]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1122])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2387]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1128])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1406]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#3414]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#3414])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#3414]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2330])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic:
    - shard-bmg:          NOTRUN -> [FAIL][143] ([Intel XE#2883]) +6 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#1499])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][145] -> [FAIL][146] ([Intel XE#1522]) +1 other test fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_vrr@max-min.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#756]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#756])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][149] -> [INCOMPLETE][150] ([Intel XE#3468]) +1 other test incomplete
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_ccs@suspend-resume.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [PASS][151] -> [DMESG-FAIL][152] ([Intel XE#1727] / [Intel XE#3468])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1123])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#2905]) +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2905]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@resume-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2905]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][157] ([Intel XE#1473])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][158] -> [TIMEOUT][159] ([Intel XE#1473] / [Intel XE#2472]) +1 other test timeout
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#688]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@many-basic-defer-mmap:
    - shard-bmg:          [PASS][161] -> [DMESG-WARN][162] ([Intel XE#3468]) +72 other tests dmesg-warn
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_exec_basic@many-basic-defer-mmap.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@xe_exec_basic@many-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2322]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1392]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1130]) +56 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - shard-lnl:          [PASS][166] -> [DMESG-FAIL][167] ([Intel XE#3466])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#288]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][169] -> [DMESG-FAIL][170] ([Intel XE#3371])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [PASS][171] -> [DMESG-FAIL][172] ([Intel XE#3371])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [PASS][173] -> [DMESG-WARN][174] ([Intel XE#358])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind-err.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][175] -> [DMESG-WARN][176] ([Intel XE#3467] / [Intel XE#3468])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][177] ([Intel XE#3467] / [Intel XE#3468])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][178] ([Intel XE#1999]) +1 other test fail
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2457])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#378])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][181] -> [DMESG-WARN][182] ([Intel XE#3467]) +1 other test dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_module_load@many-reload.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2248])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2541])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][185] ([Intel XE#1173])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#2284] / [Intel XE#366])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2284])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][189] -> [DMESG-FAIL][190] ([Intel XE#3468]) +1 other test dmesg-fail
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-lnl:          [PASS][191] -> [DMESG-WARN][192] ([Intel XE#1616] / [Intel XE#3466])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][193] -> [DMESG-WARN][194] ([Intel XE#2280] / [Intel XE#3466])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#584])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-4/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][196] -> [FAIL][197] ([Intel XE#958])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#944]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#3342])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][200] -> [SKIP][201] ([Intel XE#1130]) +159 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][202] ([Intel XE#2919])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1885]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2134]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@fbdev@unaligned-write.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@fbdev@unaligned-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][207] ([Intel XE#2613]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][209] ([Intel XE#3466]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#2705]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#1195] / [Intel XE#3226]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2423] / [i915#2575]) -> [PASS][216] +83 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          [DMESG-WARN][217] -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#3468]) -> [PASS][220] +124 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][221] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][223] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - shard-lnl:          [FAIL][225] ([Intel XE#886]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][228] +11 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [INCOMPLETE][229] ([Intel XE#1195] / [Intel XE#3468]) -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2136]) -> [PASS][232] +17 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][233] ([Intel XE#1503]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][235] ([Intel XE#3466]) -> [PASS][236] +44 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][237] ([Intel XE#2566]) -> [PASS][238] +1 other test pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][239] ([Intel XE#1430]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2446]) -> [PASS][242] +2 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][243] ([Intel XE#2042]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-dg2-set2:     [DMESG-WARN][245] ([Intel XE#3468]) -> [PASS][246] +5 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [FAIL][247] ([Intel XE#3536]) -> [PASS][248] +1 other test pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-2/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][249] ([Intel XE#899]) -> [PASS][250] +1 other test pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [INCOMPLETE][251] ([Intel XE#1727]) -> [PASS][252] +3 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-busy.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][253] ([Intel XE#3468]) -> [PASS][254] +20 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][255] -> [PASS][256] +2 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1130]) -> [PASS][258] +134 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-lnl:          [DMESG-FAIL][259] ([Intel XE#3466]) -> [PASS][260] +4 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][261] ([Intel XE#3371]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][263] ([Intel XE#3467]) -> [PASS][264] +2 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][265] ([Intel XE#2998]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][267] ([Intel XE#569]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][269] ([Intel XE#569]) -> [PASS][270] +1 other test pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-3/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][271] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-5/igt@xe_pm@s4-basic-exec.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-bmg:          [DMESG-WARN][273] ([Intel XE#1727]) -> [PASS][274] +9 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-5/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
    - shard-dg2-set2:     [DMESG-WARN][275] ([Intel XE#1727]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1885]) -> [DMESG-WARN][278] ([Intel XE#3468] / [Intel XE#3521])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_hotunplug@hotreplug.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][279] ([Intel XE#3521]) -> [SKIP][280] ([Intel XE#1885])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#316]) -> [SKIP][282] ([Intel XE#2136] / [Intel XE#2351])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][284] ([Intel XE#316])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#316])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#316]) -> [SKIP][288] ([Intel XE#2136]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][290] ([Intel XE#619])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#607])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2136]) -> [SKIP][294] ([Intel XE#1124]) +6 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][296] ([Intel XE#1124]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1124]) -> [SKIP][298] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1124]) -> [SKIP][300] ([Intel XE#2136]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2423] / [i915#2575]) -> [SKIP][302] ([Intel XE#367]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2191]) -> [SKIP][304] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2423] / [i915#2575]) -> [SKIP][306] ([Intel XE#2191])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#367]) -> [SKIP][308] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][310] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2136]) -> [SKIP][312] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2136]) -> [SKIP][314] ([Intel XE#2907])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][316] ([Intel XE#2136]) +7 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#3442])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2907]) -> [SKIP][320] ([Intel XE#2136]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][324] ([Intel XE#314])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#373]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#306]) -> [SKIP][328] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2423] / [i915#2575]) -> [SKIP][330] ([Intel XE#306]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#373]) +10 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-dg2-set2:     [DMESG-WARN][333] ([Intel XE#1727]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_color@invalid-degamma-lut-sizes.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#307]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][337] ([Intel XE#1178]) -> [INCOMPLETE][338] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_content_protection@legacy.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2423] / [i915#2575]) -> [FAIL][340] ([Intel XE#1178])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_content_protection@legacy.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][341] ([Intel XE#1178]) -> [SKIP][342] ([Intel XE#2341])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_content_protection@srm.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [FAIL][343] ([Intel XE#1178]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_content_protection@srm.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2423] / [i915#2575]) -> [SKIP][346] ([Intel XE#308]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#308]) -> [SKIP][348] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2423] / [i915#2575]) -> [SKIP][350] ([Intel XE#323])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][351] ([Intel XE#877]) -> [SKIP][352] ([Intel XE#2291])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#323]) -> [SKIP][354] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#455]) -> [SKIP][356] ([Intel XE#2351])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_dsc@dsc-basic.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#776]) -> [SKIP][358] ([Intel XE#2136]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1135]) -> [SKIP][360] ([Intel XE#2423] / [i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_feature_discovery@psr2.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][361] ([Intel XE#301]) -> [SKIP][362] ([Intel XE#2423] / [i915#2575])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][363] ([Intel XE#1727]) -> [SKIP][364] ([Intel XE#2423] / [i915#2575])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2423] / [i915#2575]) -> [FAIL][366] ([Intel XE#301])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [INCOMPLETE][367] ([Intel XE#1195] / [Intel XE#1727]) -> [INCOMPLETE][368] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2136]) -> [SKIP][370] ([Intel XE#455]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#455]) -> [SKIP][372] ([Intel XE#2136]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][374] ([Intel XE#455]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][375] ([i915#5274]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][377] ([Intel XE#2311]) -> [SKIP][378] ([Intel XE#2312]) +8 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#651]) -> [SKIP][380] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2-set2:     [INCOMPLETE][381] ([Intel XE#1195]) -> [INCOMPLETE][382] ([Intel XE#3468])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
    - shard-bmg:          [INCOMPLETE][383] ([Intel XE#3468]) -> [FAIL][384] ([Intel XE#2333])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][385] ([Intel XE#2333]) -> [DMESG-FAIL][386] ([Intel XE#3468]) +4 other tests dmesg-fail
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][387] ([Intel XE#2333]) -> [SKIP][388] ([Intel XE#2312]) +5 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [DMESG-FAIL][389] ([Intel XE#3468]) -> [FAIL][390] ([Intel XE#2333]) +9 other tests fail
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#658]) -> [SKIP][392] ([Intel XE#2136] / [Intel XE#2351])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#651]) -> [SKIP][394] ([Intel XE#2136]) +25 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136]) -> [SKIP][396] ([Intel XE#651]) +21 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][398] ([Intel XE#651]) +6 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2136]) -> [SKIP][400] ([Intel XE#653]) +20 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][401] ([Intel XE#2313]) -> [SKIP][402] ([Intel XE#2312]) +9 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#653]) -> [SKIP][404] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][406] ([Intel XE#653]) +7 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#653]) -> [SKIP][408] ([Intel XE#2136]) +26 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#455]) -> [SKIP][410] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136]) -> [SKIP][412] ([Intel XE#346])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#2927])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][415] ([Intel XE#616]) -> [SKIP][416] ([Intel XE#2423] / [i915#2575])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_cursor@primary.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2423] / [i915#2575]) -> [FAIL][418] ([Intel XE#361])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][420] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2423] / [i915#2575]) -> [SKIP][422] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2136]) -> [SKIP][424] ([Intel XE#870])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2938]) -> [SKIP][426] ([Intel XE#2136])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#870]) -> [SKIP][428] ([Intel XE#2136]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#3309]) -> [SKIP][430] ([Intel XE#2136])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][432] ([Intel XE#1129])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2136]) -> [FAIL][434] ([Intel XE#3527])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][435] ([Intel XE#3468]) -> [SKIP][436] ([Intel XE#2446])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1489]) -> [SKIP][438] ([Intel XE#2136]) +8 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2136]) -> [SKIP][440] ([Intel XE#1489]) +10 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1122]) -> [SKIP][442] ([Intel XE#2136]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][444] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-render.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][446] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][448] ([Intel XE#2136]) +10 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2351]) -> [SKIP][450] ([Intel XE#2850] / [Intel XE#929])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][452] ([Intel XE#2351])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2136]) -> [SKIP][454] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr2-basic.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][456] ([Intel XE#2939])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2136]) -> [SKIP][458] ([Intel XE#2939])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#3414]) -> [SKIP][460] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2423] / [i915#2575]) -> [SKIP][462] ([Intel XE#1127])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1127]) -> [SKIP][464] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2423] / [i915#2575]) -> [SKIP][466] ([Intel XE#3414]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#2423] / [i915#2575]) -> [SKIP][468] ([Intel XE#455]) +6 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_vrr@flipline.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-464/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#756]) -> [SKIP][470] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][472] ([Intel XE#1130]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1130]) -> [SKIP][474] ([Intel XE#1126]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1126]) -> [SKIP][476] ([Intel XE#1130]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2905]) -> [SKIP][478] ([Intel XE#1130]) +14 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1130]) -> [SKIP][480] ([Intel XE#2905]) +10 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_eudebug@sysfs-toggle.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][481] ([Intel XE#1600]) -> [SKIP][482] ([Intel XE#1130])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1130]) -> [FAIL][484] ([Intel XE#1600])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][485] ([Intel XE#1473]) -> [SKIP][486] ([Intel XE#1130])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [INCOMPLETE][487] ([Intel XE#1195]) -> [SKIP][488] ([Intel XE#1130])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     [DMESG-WARN][489] ([Intel XE#1727]) -> [SKIP][490] ([Intel XE#1130]) +2 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_exec_basic@twice-userptr.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1130]) -> [SKIP][492] ([Intel XE#288]) +24 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#288]) -> [SKIP][494] ([Intel XE#1130]) +26 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2360]) -> [SKIP][496] ([Intel XE#1130])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#2360])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][499] ([Intel XE#3467]) -> [DMESG-WARN][500] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][501] ([Intel XE#3467]) -> [SKIP][502] ([Intel XE#1130]) +4 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][503] ([Intel XE#3343]) -> [DMESG-WARN][504] ([Intel XE#3343] / [Intel XE#3468])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1130]) -> [DMESG-WARN][506] ([Intel XE#3343]) +1 other test dmesg-warn
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-FAIL][507] ([Intel XE#3467]) -> [FAIL][508] ([Intel XE#3499] / [Intel XE#3539])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][509] ([Intel XE#3499]) -> [FAIL][510] ([Intel XE#3499] / [Intel XE#3539]) +4 other tests fail
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-bmg:          [FAIL][511] ([Intel XE#3499]) -> [DMESG-FAIL][512] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-fail
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][513] ([Intel XE#3467]) -> [DMESG-FAIL][514] ([Intel XE#3467] / [Intel XE#3468])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130]) -> [DMESG-WARN][516] ([Intel XE#3467]) +2 other tests dmesg-warn
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][517] ([Intel XE#2833]) -> [SKIP][518] ([Intel XE#1192])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
    - shard-lnl:          [SKIP][519] ([Intel XE#2833]) -> [SKIP][520] ([Intel XE#1192] / [Intel XE#3026])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#1192]) -> [FAIL][522] ([Intel XE#1999])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][523] ([Intel XE#2136]) -> [DMESG-WARN][524] ([Intel XE#3467])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_module_load@many-reload.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1130]) -> [SKIP][526] ([Intel XE#2541]) +7 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#2541]) -> [SKIP][528] ([Intel XE#1130]) +9 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [SKIP][530] ([Intel XE#2839] / [Intel XE#977])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1061]) -> [FAIL][532] ([Intel XE#1173])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_peer2peer@read.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-435/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][533] ([Intel XE#1173]) -> [SKIP][534] ([Intel XE#1061])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_peer2peer@write.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#2284]) -> [SKIP][536] ([Intel XE#1130])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#1130]) -> [DMESG-WARN][538] ([Intel XE#1727] / [Intel XE#3468])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][539] ([Intel XE#569]) -> [SKIP][540] ([Intel XE#1130])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1130]) -> [DMESG-WARN][542] ([Intel XE#3468] / [Intel XE#569])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1130]) -> [DMESG-WARN][544] ([Intel XE#3468]) +2 other tests dmesg-warn
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@s4-basic.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-433/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#579]) -> [SKIP][546] ([Intel XE#1130])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-FAIL][547] ([Intel XE#1727]) -> [DMESG-WARN][548] ([Intel XE#3468]) +1 other test dmesg-warn
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1130]) -> [SKIP][550] ([Intel XE#944]) +2 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#944]) -> [SKIP][552] ([Intel XE#1130]) +3 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_query@multigpu-query-topology.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][553] -> [ABORT][554] ([Intel XE#3468] / [Intel XE#3521])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  
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
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3536
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12145
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2254-ccf64319402f90f68549e2047a7f985a46436e41

  IGTPW_12145: 12145
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12145/index.html
