Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F6DC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 18:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09811376E;
	Wed, 17 Apr 2024 18:50:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593E511376E;
 Wed, 17 Apr 2024 18:50:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4899519352040363782=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_intel=5Freg=3A_Move_decoding_?=
 =?utf-8?q?behind_an_option?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Apr 2024 18:50:51 -0000
Message-ID: <171337985135.1483178.1279319659968032643@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416154338.102157-1-lucas.demarchi@intel.com>
In-Reply-To: <20240416154338.102157-1-lucas.demarchi@intel.com>
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

--===============4899519352040363782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel_reg: Move decoding behind an option
URL   : https://patchwork.freedesktop.org/series/132506/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7809_full -> XEIGTPW_11026_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11026_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@unused-pitches:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#1201] / [i915#6077])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_addfb_basic@unused-pitches.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1201] / [Intel XE#801]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][4] ([Intel XE#650]) +8 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#316])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#829])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#1201] / [Intel XE#829])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#787]) +103 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][14] ([Intel XE#1178]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#1204]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][16] -> [DMESG-WARN][17] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#323])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][19] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#877])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#1201] / [Intel XE#1235])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_flip@2x-plain-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#605])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#1201] / [Intel XE#417])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][32] ([Intel XE#324])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#361])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#1201]) +8 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1129] / [Intel XE#1201])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_pm_rpm@universal-planes-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1122] / [Intel XE#1201])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#771] / [Intel XE#899])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][43] -> [FAIL][44] ([Intel XE#899]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][45] -> [DMESG-WARN][46] ([Intel XE#1162] / [Intel XE#1214])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][47] ([Intel XE#1214]) +1 other test dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#1201] / [Intel XE#1234])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_vrr@negative-basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_vrr@negative-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#1050])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#1259])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][55] -> [INCOMPLETE][56] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-fd-rebind:
    - shard-dg2-set2:     [PASS][57] -> [TIMEOUT][58] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) +1 other test timeout
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_exec_threads@threads-fd-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_exec_threads@threads-fd-rebind.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][59] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_exercise_blt@fast-copy-emit@linear-vram01-vram01-emit:
    - shard-dg2-set2:     [PASS][60] -> [DMESG-WARN][61] ([Intel XE#1214]) +4 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_exercise_blt@fast-copy-emit@linear-vram01-vram01-emit.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@xe_exercise_blt@fast-copy-emit@linear-vram01-vram01-emit.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#1192] / [Intel XE#1201]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][64] -> [WARN][65] ([Intel XE#1639])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][66] ([Intel XE#1162] / [Intel XE#1214])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#366])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#1201] / [i915#6077]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][72] +3 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][75] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][76] +2 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#1235]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][79] ([Intel XE#361]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#1204]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_pm_dc@dc9-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201]) -> [PASS][86] +10 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_rmfb@rmfb-ioctl.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_rmfb@rmfb-ioctl.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][87] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][91] ([Intel XE#1473]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#1259]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr:
    - shard-dg2-set2:     [ABORT][95] ([Intel XE#1304]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#1214]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - shard-dg2-set2:     [TIMEOUT][99] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_pm@d3-mmap-vram:
    - shard-dg2-set2:     [FAIL][101] ([Intel XE#1221]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_pm@d3-mmap-vram.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_pm@d3-mmap-vram.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][104] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#316])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][108] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][110] ([Intel XE#1201])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#367])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#306])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][120] ([Intel XE#1201])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-read.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#373])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][124] ([Intel XE#1201])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][126] ([Intel XE#1178]) +1 other test fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_content_protection@legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][127] ([Intel XE#1188]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#455])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_content_protection@uevent.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201]) -> [DMESG-WARN][130] ([Intel XE#1214] / [Intel XE#282])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#455])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][133] ([Intel XE#1162]) -> [SKIP][134] ([Intel XE#1201])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#1214] / [Intel XE#282]) -> [FAIL][136] ([Intel XE#581])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-left-edge.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#323])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][142] ([Intel XE#1201]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#1235])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][148] ([Intel XE#1201]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][153] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-FAIL][154] ([Intel XE#324])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#455])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#829])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_plane_lowres@tiling-yf.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][159] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][160] ([Intel XE#1195])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][161] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][162] ([Intel XE#1195])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#870])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#1235]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#929])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#1234])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_psr@pr-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][172] ([Intel XE#1201]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_psr@psr2-primary-render.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#327])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#829])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#869])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][180] ([Intel XE#1201]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_vrr@flip-basic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_vrr@flip-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][181] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][182] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][183] ([Intel XE#1195] / [Intel XE#1473]) -> [TIMEOUT][184] ([Intel XE#1473] / [Intel XE#821])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - shard-dg2-set2:     [INCOMPLETE][185] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> [TIMEOUT][186] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_exec_threads@threads-cm-fd-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-basic.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [DMESG-WARN][187] ([Intel XE#1214]) -> [TIMEOUT][188] ([Intel XE#1206])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_module_load@many-reload.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-FAIL][189] ([Intel XE#1162]) -> [FAIL][190] ([Intel XE#1043] / [Intel XE#845])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html

  
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7809 -> IGTPW_11026
  * Linux: xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266 -> xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76

  IGTPW_11026: 6b23aeaad54511c44da516424e2a94c3898a1c83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266: 29eafe20a133980d6b66d3cb97c66d1723636266
  xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76: a761439bd7de146bbb362b8c614a2863bf6d8d76

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132506v1/index.html

--===============4899519352040363782==
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
<tr><td><b>Series:</b></td><td>intel_reg: Move decoding behind an option</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132506/">https://patchwork.freedesktop.org/series/132506/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132506v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132506v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7809_full -&gt; XEIGTPW_11026_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11026_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_addfb_basic@unused-pitches.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_addfb_basic@unused-pitches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_exec_threads@threads-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_exec_threads@threads-fd-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-emit@linear-vram01-vram01-emit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_exercise_blt@fast-copy-emit@linear-vram01-vram01-emit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@xe_exercise_blt@fast-copy-emit@linear-vram01-vram01-emit.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639">Intel XE#1639</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_flip@wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_rmfb@rmfb-ioctl.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_pm@d3-mmap-vram.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_pm@d3-mmap-vram.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-466/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/869">Intel XE#869</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-436/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_exec_threads@threads-cm-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-433/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-464/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7809/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11026/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7809 -&gt; IGTPW_11026</li>
<li>Linux: xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266 -&gt; xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76</li>
</ul>
<p>IGTPW_11026: 6b23aeaad54511c44da516424e2a94c3898a1c83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1098-29eafe20a133980d6b66d3cb97c66d1723636266: 29eafe20a133980d6b66d3cb97c66d1723636266<br />
  xe-1099-a761439bd7de146bbb362b8c614a2863bf6d8d76: a761439bd7de146bbb362b8c614a2863bf6d8d76</p>

</body>
</html>

--===============4899519352040363782==--
