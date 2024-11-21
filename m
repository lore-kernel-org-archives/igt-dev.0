Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBD0D75BC3
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 06:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A60710E3D9;
	Thu, 21 Nov 2024 06:43:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944AB10E3D9;
 Thu, 21 Nov 2024 06:43:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/xe=5Feudebug=5Fonlin?=
 =?utf-8?q?e=3A_update_thread_count_handling_in_query=5Fattention=5Fbitmask?=
 =?utf-8?q?=5Fsize=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 06:43:31 -0000
Message-ID: <173217141162.1017304.4032916934942986412@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120222850.1497784-1-jan.maslak@intel.com>
In-Reply-To: <20241120222850.1497784-1-jan.maslak@intel.com>
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

Series: tests/xe_eudebug_online: update thread count handling in query_attention_bitmask_size() (rev2)
URL   : https://patchwork.freedesktop.org/series/141366/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12152_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12152_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12152_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12152_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     [PASS][2] -> [SKIP][3] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@torture-move@all-pipes:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +10 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_cursor_legacy@torture-move@all-pipes.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_cursor_legacy@torture-move@all-pipes.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_lease@implicit-plane-lease:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][8] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_lease@implicit-plane-lease.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][9] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - shard-bmg:          NOTRUN -> [ABORT][10] +1 other test abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html

  * igt@kms_vblank@wait-idle@pipe-c-edp-1:
    - shard-lnl:          [PASS][11] -> [DMESG-WARN][12] +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_vblank@wait-idle@pipe-c-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@kms_vblank@wait-idle@pipe-c-edp-1.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17] +4 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  
#### Warnings ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][18] ([Intel XE#3440]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@core_getversion@all-cards.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@core_getversion@all-cards.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#2423] / [i915#2575]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][22] ([Intel XE#1195] / [Intel XE#1727]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][24] ([Intel XE#2136]) -> [SKIP][25] +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][26] ([Intel XE#651]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][28] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][30] ([Intel XE#653]) -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-dg2-set2:     [SKIP][32] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_plane_lowres@tiling-none.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [SKIP][34] ([Intel XE#2423] / [i915#2575]) -> [SKIP][35] +8 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [SKIP][36] ([Intel XE#1130]) -> [FAIL][37] +7 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12152_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2134])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@fbdev@read.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][39] ([Intel XE#3468]) +5 other tests dmesg-fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3279])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-lnl:          [PASS][41] -> [INCOMPLETE][42] ([Intel XE#3225] / [Intel XE#3466])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#829])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2327]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1124]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1124]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2191]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2314] / [Intel XE#2894])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#367]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#829])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#3433]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#787]) +69 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2887]) +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][58] ([Intel XE#1727]) +1 other test incomplete
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2325])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#373]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2252]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#373]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#3278])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#1178])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#307])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#1178]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#308])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2320]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2321])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1424]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#309]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][72] -> [DMESG-WARN][73] ([Intel XE#877])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][74] ([Intel XE#877])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2291]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2291])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1508])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#3070])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#2244]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1138])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1137])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#3321] / [Intel XE#3487])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#2882]) +3 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#2316]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1421]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#886]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1397] / [Intel XE#1745])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2380]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#455]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2293]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#651]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2311]) +13 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][102] ([Intel XE#2333]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#651]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2352])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2313]) +14 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#656]) +21 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#653]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2312]) +8 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1503])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][110] -> [INCOMPLETE][111] ([Intel XE#3468]) +5 other tests incomplete
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-lnl:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#3466]) +29 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [PASS][114] -> [DMESG-FAIL][115] ([Intel XE#3468]) +32 other tests dmesg-fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][116] ([Intel XE#361])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2763]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2763] / [Intel XE#455])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2763]) +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2763]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][121] ([Intel XE#3527])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [PASS][122] -> [DMESG-WARN][123] ([Intel XE#3468])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1439] / [Intel XE#3141])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][125] -> [DMESG-WARN][126] ([Intel XE#1727] / [Intel XE#3468])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2893]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1489]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1489])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2387]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1128])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1406]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#3414]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#3414])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2330])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#3414]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][139] ([Intel XE#3468]) +2 other tests dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][140] -> [FAIL][141] ([Intel XE#2159]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#1499])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#756]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#756])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][145] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][146] ([Intel XE#3468]) +2 other tests dmesg-fail
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][147] ([Intel XE#3468]) +23 other tests dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#2905]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-6/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2905])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2905]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#688]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-7/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][152] ([Intel XE#1473])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][153] -> [TIMEOUT][154] ([Intel XE#1473] / [Intel XE#2472])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [PASS][155] -> [DMESG-WARN][156] ([Intel XE#3468]) +109 other tests dmesg-warn
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2322]) +8 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1392]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-lnl:          [PASS][159] -> [DMESG-FAIL][160] ([Intel XE#3466]) +1 other test dmesg-fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#288]) +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][162] -> [DMESG-WARN][163] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][164] ([Intel XE#3467])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [PASS][165] -> [SKIP][166] ([Intel XE#1192])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][167] ([Intel XE#1999]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2457])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_module_load@unload:
    - shard-bmg:          [PASS][169] -> [DMESG-WARN][170] ([Intel XE#3467])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_module_load@unload.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_module_load@unload.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][171] -> [FAIL][172] ([Intel XE#2249])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          [PASS][173] -> [FAIL][174] ([Intel XE#2249])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][175] ([Intel XE#2249])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@ccs-0.html
    - shard-bmg:          NOTRUN -> [FAIL][176] ([Intel XE#2249])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2248])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#2284] / [Intel XE#366])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2284])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-bmg:          [PASS][181] -> [DMESG-WARN][182] ([Intel XE#1616] / [Intel XE#3468])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [PASS][183] -> [DMESG-WARN][184] ([Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_pm@s3-basic.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][185] -> [DMESG-FAIL][186] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_pm@s3-mocs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][187] -> [ABORT][188] ([Intel XE#1794])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#584])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-3/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#944])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#944]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#3342])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@mmap-style-bind-one-partial:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][193] ([Intel XE#3466]) +4 other tests dmesg-warn
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@xe_vm@mmap-style-bind-one-partial.html

  * igt@xe_vm@shared-pde3-page:
    - shard-lnl:          [PASS][194] -> [DMESG-WARN][195] ([Intel XE#3466] / [Intel XE#3514])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-3/igt@xe_vm@shared-pde3-page.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@xe_vm@shared-pde3-page.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][196] ([Intel XE#2919])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][197] ([Intel XE#2919])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [DMESG-WARN][198] ([Intel XE#3521]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1885]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#3453]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2134]) -> [PASS][205] +2 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@fbdev@eof.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][206] ([Intel XE#911]) -> [PASS][207] +3 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2423] / [i915#2575]) -> [PASS][209] +56 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][210] ([Intel XE#2613]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][212] -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-FAIL][214] ([Intel XE#3468]) -> [PASS][215] +21 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][217] +10 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][218] ([Intel XE#3466]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][220] ([Intel XE#2705]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl:
    - shard-bmg:          [DMESG-WARN][222] -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_dirtyfb@default-dirtyfb-ioctl.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_dirtyfb@default-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2423]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_dp_aux_dev.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][226] ([Intel XE#2597]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [DMESG-WARN][228] ([Intel XE#3468]) -> [PASS][229] +85 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][230] ([Intel XE#301]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2136]) -> [PASS][233] +21 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-bmg:          [INCOMPLETE][234] ([Intel XE#1727]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][236] ([Intel XE#1503]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][238] ([Intel XE#3466]) -> [PASS][239] +40 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][240] ([Intel XE#2566]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][242] ([Intel XE#1430]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][244] ([Intel XE#3468]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2446]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [FAIL][248] ([Intel XE#3536]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][250] ([Intel XE#2883]) -> [PASS][251] +2 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][252] ([Intel XE#899]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][254] ([Intel XE#1600]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-dg2-set2:     [DMESG-WARN][256] ([Intel XE#1727]) -> [PASS][257] +2 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_evict@evict-small-multi-vm.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][258] ([Intel XE#1727]) -> [PASS][259] +4 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [DMESG-FAIL][260] ([Intel XE#3466]) -> [PASS][261] +4 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [SKIP][262] ([Intel XE#1192]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [DMESG-WARN][264] ([Intel XE#3467]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][266] ([Intel XE#569]) -> [PASS][267] +1 other test pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][268] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-FAIL][270] ([Intel XE#1727]) -> [PASS][271] +1 other test pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1130]) -> [PASS][273] +132 other tests pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][275] ([Intel XE#316]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][276] ([Intel XE#3468]) -> [DMESG-FAIL][277] ([Intel XE#3468])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2136]) -> [SKIP][279] ([Intel XE#316]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#2136]) -> [SKIP][281] ([Intel XE#829]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1124]) -> [SKIP][283] ([Intel XE#829]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][285] ([Intel XE#829])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2136]) -> [SKIP][287] ([Intel XE#1124]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][289] ([Intel XE#1124]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][291] ([Intel XE#619])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2136]) -> [SKIP][293] ([Intel XE#607])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#2423] / [i915#2575]) -> [SKIP][295] ([Intel XE#2191])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2423] / [i915#2575]) -> [SKIP][297] ([Intel XE#367]) +5 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2136]) -> [SKIP][299] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2136]) -> [SKIP][301] ([Intel XE#2907]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][303] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2423] / [i915#2575]) -> [SKIP][305] ([Intel XE#373]) +5 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_chamelium_audio@hdmi-audio.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2423] / [i915#2575]) -> [SKIP][307] ([Intel XE#306])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2423] / [i915#2575]) -> [FAIL][309] ([Intel XE#1178])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [FAIL][310] ([Intel XE#1178]) -> [INCOMPLETE][311] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2423] / [i915#2575]) -> [SKIP][313] ([Intel XE#308])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][314] ([Intel XE#2882]) -> [SKIP][315] ([Intel XE#2316])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][316] ([Intel XE#3487]) -> [FAIL][317] ([Intel XE#3321] / [Intel XE#3487])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-FAIL][318] ([Intel XE#1727]) -> [FAIL][319] ([Intel XE#301]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][320] ([Intel XE#301] / [Intel XE#3487]) -> [FAIL][321] ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) +1 other test fail
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2136]) -> [SKIP][323] ([Intel XE#455])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][325] ([Intel XE#455]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][326] ([Intel XE#3468]) -> [FAIL][327] ([Intel XE#2333]) +6 other tests fail
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][328] ([Intel XE#2333]) -> [DMESG-FAIL][329] ([Intel XE#3468]) +13 other tests dmesg-fail
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][330] ([Intel XE#2333]) -> [SKIP][331] ([Intel XE#2312]) +5 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [DMESG-FAIL][332] ([Intel XE#3468]) -> [SKIP][333] ([Intel XE#2312]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2136]) -> [SKIP][335] ([Intel XE#651]) +12 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][336] ([Intel XE#2311]) -> [SKIP][337] ([Intel XE#2312]) +14 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][339] ([Intel XE#651]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2136]) -> [SKIP][341] ([Intel XE#653]) +27 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][342] ([Intel XE#2313]) -> [SKIP][343] ([Intel XE#2312]) +14 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2136]) -> [SKIP][345] ([Intel XE#783])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][347] ([Intel XE#653]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][348] ([Intel XE#2333]) -> [INCOMPLETE][349] ([Intel XE#2050] / [Intel XE#3468])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          [FAIL][350] ([Intel XE#2333]) -> [INCOMPLETE][351] ([Intel XE#3468])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2136]) -> [SKIP][353] ([Intel XE#1158])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2136]) -> [SKIP][355] ([Intel XE#2925])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#2136]) -> [SKIP][357] ([Intel XE#2927])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#2423] / [i915#2575]) -> [SKIP][359] ([Intel XE#356])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2423] / [i915#2575]) -> [FAIL][361] ([Intel XE#361])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#2423] / [i915#2575]) -> [SKIP][363] ([Intel XE#2763] / [Intel XE#455])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][365] ([Intel XE#1122])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2136]) -> [SKIP][367] ([Intel XE#1129])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][368] ([Intel XE#1430]) -> [DMESG-FAIL][369] ([Intel XE#3468])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#2136]) -> [FAIL][371] ([Intel XE#3527])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2446]) -> [DMESG-WARN][373] ([Intel XE#3468]) +1 other test dmesg-warn
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2446]) -> [ABORT][375] ([Intel XE#3468])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][376] ([Intel XE#2864]) -> [DMESG-WARN][377] ([Intel XE#3468])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_prop_blob@invalid-get-prop-any:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2423] / [i915#2575]) -> [SKIP][379] ([Intel XE#780])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_prop_blob@invalid-get-prop-any.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_prop_blob@invalid-get-prop-any.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2136]) -> [SKIP][381] ([Intel XE#1489]) +8 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][383] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#2136]) -> [SKIP][385] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr2-basic.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][387] ([Intel XE#2939])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2423] / [i915#2575]) -> [SKIP][389] ([Intel XE#3414]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][390] ([Intel XE#2426]) -> [FAIL][391] ([Intel XE#1729])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [INCOMPLETE][392] ([Intel XE#1727]) -> [DMESG-WARN][393] ([Intel XE#3468])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-busy.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-6/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][395] ([Intel XE#3468])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][396] ([Intel XE#1727]) -> [DMESG-WARN][397] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-warn
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2423] / [i915#2575]) -> [SKIP][399] ([Intel XE#455]) +7 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_vrr@flipline.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][400] -> [DMESG-WARN][401] ([Intel XE#3468]) +1 other test dmesg-warn
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2423] / [i915#2575]) -> [SKIP][403] ([Intel XE#756]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#1130]) -> [DMESG-FAIL][405] ([Intel XE#3468])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_ccs@suspend-resume.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-436/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1130]) -> [SKIP][407] ([Intel XE#1126]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#1130]) -> [SKIP][409] ([Intel XE#2905]) +7 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#1130]) -> [TIMEOUT][411] ([Intel XE#1473] / [Intel XE#402])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][412] ([Intel XE#2364]) -> [DMESG-FAIL][413] ([Intel XE#3468])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][414] ([Intel XE#1473]) -> [INCOMPLETE][415] ([Intel XE#1473])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     [TIMEOUT][416] ([Intel XE#1473]) -> [INCOMPLETE][417] ([Intel XE#1473])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1130]) -> [SKIP][419] ([Intel XE#288]) +24 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-FAIL][420] ([Intel XE#3467]) -> [DMESG-FAIL][421] ([Intel XE#3467] / [Intel XE#3468])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][422] ([Intel XE#3499]) -> [DMESG-FAIL][423] ([Intel XE#3467] / [Intel XE#3468])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][424] ([Intel XE#3499]) -> [FAIL][425] ([Intel XE#3499] / [Intel XE#3539]) +4 other tests fail
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-lnl-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-bmg:          [FAIL][426] ([Intel XE#3499]) -> [FAIL][427] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][428] ([Intel XE#3467]) -> [FAIL][429] ([Intel XE#3499] / [Intel XE#3539])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#1130]) -> [DMESG-WARN][431] ([Intel XE#3467]) +1 other test dmesg-warn
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
    - shard-bmg:          [DMESG-WARN][432] ([Intel XE#3467]) -> [DMESG-WARN][433] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#1130]) -> [DMESG-WARN][435] ([Intel XE#3468])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_gt_freq@freq_suspend.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-435/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][436] ([Intel XE#2833]) -> [SKIP][437] ([Intel XE#1192])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#1192]) -> [FAIL][439] ([Intel XE#1999])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][440] ([Intel XE#2136]) -> [DMESG-FAIL][441] ([Intel XE#3467])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#1130]) -> [SKIP][443] ([Intel XE#2541]) +3 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_oa@disabled-read-error.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-463/igt@xe_oa@disabled-read-error.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#1130]) -> [SKIP][445] ([Intel XE#944]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
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
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
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
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3536
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12152
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99

  IGTPW_12152: 12152
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99: 0cb17ecec562c61d45997a2fced4e5ed99b31f99

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12152/index.html
