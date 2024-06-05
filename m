Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32513C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8B710E611;
	Wed,  5 Jun 2024 14:37:16 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CB210E611;
 Wed,  5 Jun 2024 14:37:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4059968609705871664=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_tools/lsgpu=3A_Add_switch_to_?=
 =?utf-8?q?display_gpu_pci_devices_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Jun 2024 14:37:13 -0000
Message-ID: <171759823329.79.5770108262588664437@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605045308.97175-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240605045308.97175-1-zbigniew.kempczynski@intel.com>
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

--===============4059968609705871664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/lsgpu: Add switch to display gpu pci devices (rev2)
URL   : https://patchwork.freedesktop.org/series/134438/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7877_full -> XEIGTPW_11220_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11220_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-lnl}:        [DMESG-WARN][1] ([Intel XE#1830]) -> [FAIL][2] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - {shard-lnl}:        NOTRUN -> [FAIL][3] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - {shard-lnl}:        [SKIP][4] ([Intel XE#656]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - {shard-lnl}:        [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_pm_dc@dc9-dpms:
    - {shard-lnl}:        [PASS][8] -> [FAIL][9] +12 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-7/igt@kms_pm_dc@dc9-dpms.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@xe_pm@s2idle-multiple-execs:
    - {shard-lnl}:        NOTRUN -> [DMESG-FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-8/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - {shard-lnl}:        [PASS][11] -> [DMESG-FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-7/igt@xe_pm@s2idle-vm-bind-prefetch.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11220_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#610])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#346])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#1178]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#308])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#323])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#653]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#756])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1123])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1123] / [Intel XE#1201])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#1600])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_vm@large-userptr-binds-4194304:
    - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#1638])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@xe_vm@large-userptr-binds-4194304.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@xe_vm@large-userptr-binds-4194304.html

  
#### Possible fixes ####

  * {igt@core_getversion@all-cards}:
    - shard-dg2-set2:     [DMESG-WARN][41] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@core_getversion@all-cards.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@core_getversion@all-cards.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-lnl}:        [FAIL][43] ([Intel XE#1659]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][45] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][47] ([Intel XE#1195]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][49] ([Intel XE#1473]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][51] ([Intel XE#1192]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - {shard-lnl}:        [ABORT][53] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [DMESG-WARN][55] ([Intel XE#1214]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@xe_pm@s4-mocs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - {shard-lnl}:        [FAIL][57] ([Intel XE#1442]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-3/igt@xe_pm_residency@gt-c6-on-idle.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-7/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-hammer:
    - {shard-lnl}:        [FAIL][59] ([Intel XE#1081]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-3/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-8/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][62] ([Intel XE#316]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][63] ([Intel XE#316]) -> [SKIP][64] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][66] ([Intel XE#1124]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#1124]) -> [SKIP][68] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][70] ([Intel XE#367])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#367]) -> [SKIP][72] ([Intel XE#1201] / [Intel XE#367])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#787]) -> [SKIP][74] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][76] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][78] ([Intel XE#787]) +27 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][80] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][82] ([Intel XE#1152]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#373]) -> [SKIP][84] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#306]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#306])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][88] ([Intel XE#373]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][90] ([Intel XE#307])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#308]) -> [SKIP][92] ([Intel XE#1201] / [Intel XE#308])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][94] ([Intel XE#308])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#455]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][98] ([Intel XE#282]) +4 other tests dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][99] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][100] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) +1 other test dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][102] ([Intel XE#323])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][103] ([Intel XE#282]) -> [DMESG-WARN][104] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][105] ([Intel XE#282]) -> [INCOMPLETE][106] ([Intel XE#1195]) +1 other test incomplete
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][108] ([Intel XE#703])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][109] ([Intel XE#1195]) -> [DMESG-WARN][110] ([Intel XE#1162] / [Intel XE#1214])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][112] ([Intel XE#455]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#651]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][116] ([Intel XE#651]) +13 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#653]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#658]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#658])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][122] ([Intel XE#653]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][124] ([Intel XE#605])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][126] ([Intel XE#417])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][128] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][130] ([Intel XE#498]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#305]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][136] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][138] ([Intel XE#305]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][140] ([Intel XE#1129])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#908])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][144] ([Intel XE#929]) +7 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][146] ([Intel XE#1122])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#929]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1127]) -> [SKIP][150] ([Intel XE#1127] / [Intel XE#1201])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][152] ([Intel XE#327])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#327]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#327])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][156] ([Intel XE#756])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][158] ([Intel XE#1126])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][160] ([Intel XE#1195] / [Intel XE#1473])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][161] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][162] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#288]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][166] ([Intel XE#288]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [INCOMPLETE][167] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358] / [Intel XE#569]) -> [DMESG-WARN][168] ([Intel XE#1162] / [Intel XE#1214])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][170] ([Intel XE#366])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#944]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#944])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][174] ([Intel XE#944]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1130]) -> [DMESG-WARN][176] ([Intel XE#1214] / [Intel XE#1760])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_7877 -> IGTPW_11220
  * Linux: xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62 -> xe-1399-596cf447db94909c4788fd612876520531e439b0

  IGTPW_11220: 11220
  IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62: 692c2b76453385a04b1eef40f3cdbc0097074f62
  xe-1399-596cf447db94909c4788fd612876520531e439b0: 596cf447db94909c4788fd612876520531e439b0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/index.html

--===============4059968609705871664==
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
<tr><td><b>Series:</b></td><td>tools/lsgpu: Add switch to display gpu pci devices (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134438/">https://patchwork.freedesktop.org/series/134438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7877_full -&gt; XEIGTPW_11220_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11220_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830">Intel XE#1830</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-7/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-6/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-8/igt@xe_pm@s2idle-multiple-execs.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-7/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11220_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-4194304:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@xe_vm@large-userptr-binds-4194304.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@xe_vm@large-userptr-binds-4194304.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_getversion@all-cards}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@core_getversion@all-cards.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@xe_pm@s4-mocs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-3/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442">Intel XE#1442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-7/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-lnl-3/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-lnl-8/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7877/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11220/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7877 -&gt; IGTPW_11220</li>
<li>Linux: xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62 -&gt; xe-1399-596cf447db94909c4788fd612876520531e439b0</li>
</ul>
<p>IGTPW_11220: 11220<br />
  IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1391-692c2b76453385a04b1eef40f3cdbc0097074f62: 692c2b76453385a04b1eef40f3cdbc0097074f62<br />
  xe-1399-596cf447db94909c4788fd612876520531e439b0: 596cf447db94909c4788fd612876520531e439b0</p>

</body>
</html>

--===============4059968609705871664==--
