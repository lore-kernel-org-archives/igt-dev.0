Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52139D3A678
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 18:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD7210E3A5;
	Tue, 29 Oct 2024 18:18:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A85410E3A5;
 Tue, 29 Oct 2024 18:18:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5667932574025275261=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/gem=5Fctx=5Fpersi?=
 =?utf-8?q?stence=3A_Wait_for_context_termination?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 29 Oct 2024 18:18:44 -0000
Message-ID: <173022592415.1360633.16927327203874905281@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241028125640.22936-3-krzysztof.niemiec@intel.com>
In-Reply-To: <20241028125640.22936-3-krzysztof.niemiec@intel.com>
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

--===============5667932574025275261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_ctx_persistence: Wait for context termination
URL   : https://patchwork.freedesktop.org/series/140582/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8087_full -> XEIGTPW_11992_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11992_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11992_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11992_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][11] ([Intel XE#2327]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][13] ([Intel XE#1124]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][15] ([Intel XE#2887]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][17] ([Intel XE#2311]) -> [SKIP][18] +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][19] ([Intel XE#2333]) -> [SKIP][20] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][21] ([Intel XE#2313]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][23] ([Intel XE#1489]) -> [SKIP][24] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          [SKIP][25] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][26] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][27] ([Intel XE#1130]) -> [FAIL][28] +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11992_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2134]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@fbdev@nullptr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#2134])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@fbdev@unaligned-write.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#623])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][34] -> [INCOMPLETE][35] ([Intel XE#2613])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1195]) +2 other tests incomplete
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1407])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2890]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#877])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#316]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#829])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1124])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1124]) +11 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2191])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#367]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#787]) +83 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2887])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#2907]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#1195] / [Intel XE#2692])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#306])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#306]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#373])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#373]) +8 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#307])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#1178])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#308])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1424])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2577]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#323])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#1475])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2244])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1421])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#301]) +14 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#301]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#3267])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#301]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#301]) +8 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2423]) +67 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_flip@flip-vs-panning-vs-hang.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [PASS][78] -> [INCOMPLETE][79] ([Intel XE#2597]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#886]) +3 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2380])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1397] / [Intel XE#1745])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1397])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#651]) +34 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#656]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#651]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#3187]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#653]) +27 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     NOTRUN -> [ABORT][91] ([Intel XE#2625]) +2 other tests abort
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1503])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [PASS][93] -> [DMESG-WARN][94] ([Intel XE#2566] / [Intel XE#877])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:
    - shard-bmg:          [PASS][95] -> [DMESG-WARN][96] ([Intel XE#877])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [FAIL][97] ([Intel XE#361]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2763]) +8 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#3187]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2763]) +15 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#870]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#2446]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_pm_rpm@i2c.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2042])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1489]) +10 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1122]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#2948]) +5 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2850] / [Intel XE#929]) +19 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#3189]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_rmfb@rmfb-ioctl.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#829])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-463/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#829])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#327]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][121] ([Intel XE#2883]) +5 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2168])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#2443]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_vrr@flip-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#455]) +21 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          NOTRUN -> [FAIL][126] ([Intel XE#2443]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#756])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1123])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1126])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2905]) +13 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2905])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [PASS][132] -> [FAIL][133] ([Intel XE#2364])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][134] -> [TIMEOUT][135] ([Intel XE#1473])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][136] -> [TIMEOUT][137] ([Intel XE#1473] / [Intel XE#402])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
    - shard-bmg:          [PASS][138] -> [TIMEOUT][139] ([Intel XE#1473])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#688]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][141] ([Intel XE#1600])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][142] ([Intel XE#1473]) +1 other test timeout
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1392])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][144] -> [FAIL][145] ([Intel XE#3160])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#288]) +28 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2360])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][148] -> [DMESG-WARN][149] ([Intel XE#3184]) +2 other tests dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][150] ([Intel XE#1999]) +2 other tests fail
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][151] -> [FAIL][152] ([Intel XE#2136]) +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@xe_module_load@reload-no-display.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [PASS][153] -> [FAIL][154] ([Intel XE#2136])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2541]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][157] -> [ABORT][158] ([Intel XE#1694] / [Intel XE#1794])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][159] ([Intel XE#1358])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [PASS][160] -> [ABORT][161] ([Intel XE#1358])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-463/igt@xe_pm@s3-exec-after.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][162] -> [ABORT][163] ([Intel XE#1794])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#944]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#944])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][166] -> [SKIP][167] ([Intel XE#1130]) +154 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@xe_query@query-gt-list.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_query@query-gt-list.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     NOTRUN -> [FAIL][168] ([Intel XE#2922])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@xe_tlb@basic-tlb.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][169] ([Intel XE#1885]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][171] ([Intel XE#3130]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][173] -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html
    - shard-dg2-set2:     [FAIL][175] -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@pan:
    - shard-bmg:          [SKIP][177] ([Intel XE#2134]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@fbdev@pan.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@fbdev@pan.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][179] ([Intel XE#2231]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][181] ([Intel XE#2890]) -> [PASS][182] +14 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-lnl:          [FAIL][183] ([Intel XE#1454]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][185] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][189] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_color@ctm-0-75@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][191] ([Intel XE#2929]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-5/igt@kms_color@ctm-0-75@pipe-c-edp-1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@kms_color@ctm-0-75@pipe-c-edp-1.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-lnl:          [FAIL][193] ([Intel XE#2577]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][195] ([Intel XE#877]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-bmg:          [SKIP][197] ([Intel XE#3007]) -> [PASS][198] +5 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_cursor_legacy@forked-move.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][199] ([Intel XE#301]) -> [PASS][200] +3 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][201] ([Intel XE#2423]) -> [PASS][202] +77 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][205] ([Intel XE#886]) -> [PASS][206] +4 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          [SKIP][207] -> [PASS][208] +3 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2890]) -> [PASS][210] +5 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][211] ([Intel XE#616]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_plane_cursor@viewport.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][213] ([Intel XE#718]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [SKIP][215] ([Intel XE#2446]) -> [PASS][216] +3 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_pm_rpm@cursor.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2446]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][219] -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [FAIL][221] ([Intel XE#2948]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@kms_rmfb@close-fd:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2423] / [i915#2575]) -> [PASS][224] +8 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_rmfb@close-fd.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_rmfb@close-fd.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][225] ([Intel XE#2883]) -> [PASS][226] +2 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-idle:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1130]) -> [PASS][228] +21 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][229] ([Intel XE#3160]) -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
    - shard-lnl:          [DMESG-WARN][231] -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [FAIL][233] ([Intel XE#1999]) -> [PASS][234] +2 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][235] ([Intel XE#1794]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][237] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@xe_pm@s4-exec-after.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][239] ([Intel XE#1130]) -> [PASS][240] +192 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_tlb@basic-tlb:
    - shard-bmg:          [CRASH][241] ([Intel XE#3212]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_tlb@basic-tlb.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@xe_tlb@basic-tlb.html
    - shard-lnl:          [CRASH][243] ([Intel XE#3212]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-8/igt@xe_tlb@basic-tlb.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@mixed-binds-1611661312:
    - shard-dg2-set2:     [INCOMPLETE][245] ([Intel XE#1195]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@xe_vm@mixed-binds-1611661312.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_vm@mixed-binds-1611661312.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][247] ([Intel XE#2233]) -> [SKIP][248] ([Intel XE#2423])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2423] / [i915#2575]) -> [SKIP][250] ([Intel XE#873])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][251] ([Intel XE#2370]) -> [SKIP][252] ([Intel XE#2423])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][253] ([Intel XE#2423]) -> [SKIP][254] ([Intel XE#2370])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][255] ([Intel XE#2890]) -> [SKIP][256] ([Intel XE#2327]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][258] ([Intel XE#316])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-bmg:          [SKIP][259] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][260] ([Intel XE#2327])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][261] ([Intel XE#2327]) -> [SKIP][262] ([Intel XE#2890]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][263] -> [SKIP][264] ([Intel XE#2327]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][265] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][266] ([Intel XE#1124]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][268] ([Intel XE#1124])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][269] ([Intel XE#2890]) -> [SKIP][270] ([Intel XE#607])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][271] ([Intel XE#2890]) -> [SKIP][272] ([Intel XE#1124]) +7 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][273] ([Intel XE#1124]) -> [SKIP][274] ([Intel XE#2890]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][275] ([Intel XE#1124]) -> [SKIP][276] ([Intel XE#829])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2890]) -> [SKIP][278] ([Intel XE#1124]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][279] -> [SKIP][280] ([Intel XE#2328])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][281] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][282] ([Intel XE#2423])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][283] ([Intel XE#2423]) -> [SKIP][284] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][285] ([Intel XE#367]) -> [SKIP][286] ([Intel XE#2423]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][287] ([Intel XE#2423]) -> [SKIP][288] ([Intel XE#367]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][289] ([Intel XE#2887]) -> [SKIP][290] ([Intel XE#2890]) +12 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][291] -> [SKIP][292] ([Intel XE#2887]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2890]) -> [SKIP][294] ([Intel XE#455] / [Intel XE#787])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
    - shard-bmg:          [SKIP][295] ([Intel XE#2231]) -> [SKIP][296] ([Intel XE#2887])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][297] ([Intel XE#2890]) -> [SKIP][298] ([Intel XE#2887]) +11 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][299] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][300] ([Intel XE#2887])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][301] ([Intel XE#2724]) -> [SKIP][302] ([Intel XE#2890])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_cdclk@mode-transition.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][303] ([Intel XE#2890]) -> [SKIP][304] ([Intel XE#2724]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][305] ([Intel XE#2325]) -> [SKIP][306] ([Intel XE#2423])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][307] ([Intel XE#2423]) -> [SKIP][308] ([Intel XE#2325]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][309] ([Intel XE#3007]) -> [SKIP][310] ([Intel XE#2325])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#306])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#373]) -> [SKIP][314] ([Intel XE#3187])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - shard-bmg:          [SKIP][315] ([Intel XE#2252]) -> [SKIP][316] ([Intel XE#3189])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][317] ([Intel XE#2423]) -> [SKIP][318] ([Intel XE#2252]) +8 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][319] ([Intel XE#2252]) -> [SKIP][320] ([Intel XE#2423]) +8 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][321] ([Intel XE#2390]) -> [SKIP][322] ([Intel XE#2423])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [FAIL][324] ([Intel XE#1178])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][325] ([Intel XE#1178]) -> [SKIP][326] ([Intel XE#2423])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_content_protection@srm.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][327] ([Intel XE#2341]) -> [SKIP][328] ([Intel XE#2423])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_content_protection@type1.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][329] ([Intel XE#2423]) -> [SKIP][330] ([Intel XE#2320]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#2321]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][333] ([Intel XE#3007]) -> [SKIP][334] ([Intel XE#2423]) +5 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#455]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][337] ([Intel XE#2321]) -> [SKIP][338] ([Intel XE#2423])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          [SKIP][339] ([Intel XE#2423]) -> [SKIP][340] ([Intel XE#3189])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_crc@cursor-random-128x42.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][341] ([Intel XE#2320]) -> [SKIP][342] ([Intel XE#2423]) +5 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][343] ([Intel XE#3007]) -> [SKIP][344] ([Intel XE#2320])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][345] ([Intel XE#2286]) -> [SKIP][346] ([Intel XE#2423])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][347] ([Intel XE#2423]) -> [SKIP][348] ([Intel XE#2286])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2890]) -> [SKIP][350] ([Intel XE#455])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][351] ([Intel XE#2423]) -> [SKIP][352] ([Intel XE#2375])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][353] ([Intel XE#3007]) -> [SKIP][354] ([Intel XE#2374])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_feature_discovery@psr2.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2423] / [i915#2575]) -> [SKIP][356] ([Intel XE#1135])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][357] ([Intel XE#2423]) -> [FAIL][358] ([Intel XE#301])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][359] ([Intel XE#301]) -> [SKIP][360] ([Intel XE#2423])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][361] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [ABORT][362] ([Intel XE#2625])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][363] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][364] ([Intel XE#2890]) +4 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][365] -> [SKIP][366] ([Intel XE#2380])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][367] ([Intel XE#2890]) -> [SKIP][368] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][369] -> [SKIP][370] ([Intel XE#2293] / [Intel XE#2380])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][371] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][372] ([Intel XE#2311]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][373] -> [SKIP][374] ([Intel XE#2311]) +6 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][375] ([Intel XE#2311]) -> [SKIP][376] ([Intel XE#2890]) +16 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#651]) -> [SKIP][378] ([Intel XE#3187] / [Intel XE#783])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][380] ([Intel XE#651]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][381] ([Intel XE#2890]) -> [SKIP][382] ([Intel XE#2311]) +17 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][383] ([Intel XE#2311]) -> [SKIP][384] ([Intel XE#3189]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          [FAIL][385] ([Intel XE#2333]) -> [SKIP][386] ([Intel XE#2890]) +8 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][387] ([Intel XE#2231]) -> [FAIL][388] ([Intel XE#2333])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [FAIL][389] ([Intel XE#2333]) -> [INCOMPLETE][390] ([Intel XE#2050])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][391] ([Intel XE#2890]) -> [FAIL][392] ([Intel XE#2333]) +13 other tests fail
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          [SKIP][393] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][394] ([Intel XE#2333]) +2 other tests fail
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][395] ([Intel XE#2352]) -> [SKIP][396] ([Intel XE#2890])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][397] ([Intel XE#2231]) -> [SKIP][398] ([Intel XE#2311]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2890]) -> [SKIP][400] ([Intel XE#651]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][401] ([Intel XE#2890]) -> [SKIP][402] ([Intel XE#3189]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][403] ([Intel XE#2890]) -> [SKIP][404] ([Intel XE#2313]) +22 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#653]) -> [SKIP][406] ([Intel XE#3187]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][407] -> [SKIP][408] ([Intel XE#2313]) +7 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][409] ([Intel XE#2313]) -> [SKIP][410] ([Intel XE#2890]) +19 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][411] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][412] ([Intel XE#2313]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2890]) -> [SKIP][414] ([Intel XE#653]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][415] ([Intel XE#2313]) -> [SKIP][416] ([Intel XE#3189])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][418] ([Intel XE#653])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][419] ([Intel XE#2423]) -> [SKIP][420] ([Intel XE#2340])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][421] ([Intel XE#2423]) -> [SKIP][422] ([Intel XE#2486])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][423] ([Intel XE#2423]) -> [SKIP][424] ([Intel XE#2493])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][425] ([Intel XE#2493]) -> [SKIP][426] ([Intel XE#2423])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-bmg:          [SKIP][427] ([Intel XE#3007]) -> [SKIP][428] ([Intel XE#2763])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2423] / [i915#2575]) -> [SKIP][430] ([Intel XE#2763] / [Intel XE#455])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][431] ([Intel XE#2423]) -> [SKIP][432] ([Intel XE#2763]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][433] ([Intel XE#2763]) -> [SKIP][434] ([Intel XE#2423]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][435] -> [SKIP][436] ([Intel XE#870])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][437] ([Intel XE#2392]) -> [SKIP][438] ([Intel XE#2890])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][439] ([Intel XE#2890]) -> [SKIP][440] ([Intel XE#2392])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][441] ([Intel XE#2505]) -> [SKIP][442] ([Intel XE#2890])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][443] ([Intel XE#2446]) -> [SKIP][444] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][445] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][446] ([Intel XE#2446])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][447] -> [SKIP][448] ([Intel XE#1489]) +7 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1489]) -> [SKIP][450] ([Intel XE#3187])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-bmg:          [SKIP][451] ([Intel XE#1489]) -> [SKIP][452] ([Intel XE#3189])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][453] ([Intel XE#1489]) -> [SKIP][454] ([Intel XE#2890]) +3 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][455] ([Intel XE#2890]) -> [SKIP][456] ([Intel XE#1489])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][457] ([Intel XE#2387]) -> [SKIP][458] ([Intel XE#2890])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-bmg:          [SKIP][459] ([Intel XE#2231]) -> [SKIP][460] ([Intel XE#3189])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-render.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2890]) -> [SKIP][462] ([Intel XE#3187])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-render.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-bmg:          [SKIP][463] -> [SKIP][464] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-blt.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          [SKIP][465] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][466] ([Intel XE#2890]) +9 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-blt.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][467] ([Intel XE#2890]) -> [SKIP][468] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr@psr-basic.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][469] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][470] ([Intel XE#2890]) +5 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#2351]) -> [SKIP][472] ([Intel XE#2850] / [Intel XE#929])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][474] ([Intel XE#3187])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_psr@psr2-primary-render.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_psr@psr2-primary-render.html
    - shard-bmg:          [SKIP][475] -> [SKIP][476] ([Intel XE#3189])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr@psr2-primary-render.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][477] ([Intel XE#2414]) -> [SKIP][478] ([Intel XE#2890])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][479] ([Intel XE#2329]) -> [SKIP][480] ([Intel XE#2423])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][481] ([Intel XE#2330]) -> [SKIP][482] ([Intel XE#2423])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][483] ([Intel XE#2423]) -> [SKIP][484] ([Intel XE#2330])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][485] ([Intel XE#2423]) -> [SKIP][486] ([Intel XE#2413])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [SKIP][487] ([Intel XE#2423]) -> [FAIL][488] ([Intel XE#2883])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_setmode@basic.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][489] ([Intel XE#2423]) -> [SKIP][490] ([Intel XE#2509])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][491] ([Intel XE#2423]) -> [SKIP][492] ([Intel XE#2450])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][493] ([Intel XE#1499]) -> [SKIP][494] ([Intel XE#2423])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_vrr@max-min.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][495] ([Intel XE#2423]) -> [SKIP][496] ([Intel XE#1499])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2423] / [i915#2575]) -> [SKIP][498] ([Intel XE#756])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][499] ([Intel XE#2423]) -> [SKIP][500] ([Intel XE#756]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][501] ([Intel XE#756]) -> [SKIP][502] ([Intel XE#2423])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][503] ([Intel XE#2423]) -> [SKIP][504] ([Intel XE#1091] / [Intel XE#2849])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [FAIL][505] ([Intel XE#1050]) -> [SKIP][506] ([Intel XE#1130])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][507] ([Intel XE#1130]) -> [SKIP][508] ([Intel XE#2504])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][509] ([Intel XE#1130]) -> [SKIP][510] ([Intel XE#2905]) +11 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_eudebug_online@single-step.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_eudebug_online@single-step.html
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1130]) -> [SKIP][512] ([Intel XE#2905])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_eudebug_online@single-step.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][513] ([Intel XE#2905]) -> [SKIP][514] ([Intel XE#1130]) +9 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][515] ([Intel XE#2364]) -> [SKIP][516] ([Intel XE#1130])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [SKIP][517] ([Intel XE#1130]) -> [TIMEOUT][518] ([Intel XE#1473]) +1 other test timeout
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][519] ([Intel XE#1130]) -> [SKIP][520] ([Intel XE#2322]) +10 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][521] ([Intel XE#2322]) -> [SKIP][522] ([Intel XE#1130]) +8 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1130]) -> [SKIP][524] ([Intel XE#288]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [INCOMPLETE][525] ([Intel XE#1195]) -> [TIMEOUT][526] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][527] ([Intel XE#1130]) -> [SKIP][528] ([Intel XE#2284]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_pm@d3cold-mocs.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [SKIP][530] ([Intel XE#2284])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][531] ([Intel XE#2284]) -> [SKIP][532] ([Intel XE#1130])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][533] ([Intel XE#1130]) -> [SKIP][534] ([Intel XE#944]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_query@multigpu-query-config.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][535] ([Intel XE#944]) -> [SKIP][536] ([Intel XE#1130])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][537] -> [SKIP][538] ([Intel XE#1130])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1454]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3187]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187
  [Intel XE#3189]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8087 -> IGTPW_11992
  * Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -> xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682

  IGTPW_11992: 3342f387a4c17dbc466bbdf0099520c573107185 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab
  xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682: 95fd9af8bb5389f9b5a639d567ef5c3e43e25682

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/index.html

--===============5667932574025275261==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_ctx_persistence: Wait for context termination</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140582/">https://patchwork.freedesktop.org/series/140582/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8087_full -&gt; XEIGTPW_11992_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11992_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11992_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11992_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11992_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267">Intel XE#3267</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_rmfb@rmfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-463/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_setmode@basic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-8/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-436/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-463/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@xe_query@query-gt-list.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_query@query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +154 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@fbdev@pan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454">Intel XE#1454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-5/igt@kms_color@ctm-0-75@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@kms_color@ctm-0-75@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_cursor_legacy@forked-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_cursor_legacy@forked-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_pm_rpm@cursor.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_rmfb@close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@kms_rmfb@close-fd.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +192 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@xe_tlb@basic-tlb.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-8/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-lnl-2/igt@xe_tlb@basic-tlb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-binds-1611661312:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@xe_vm@mixed-binds-1611661312.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-436/igt@xe_vm@mixed-binds-1611661312.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-8/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-433/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3187">Intel XE#3187</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-432/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-436/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11992/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8087 -&gt; IGTPW_11992</li>
<li>Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -&gt; xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682</li>
</ul>
<p>IGTPW_11992: 3342f387a4c17dbc466bbdf0099520c573107185 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab<br />
  xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682: 95fd9af8bb5389f9b5a639d567ef5c3e43e25682</p>

</body>
</html>

--===============5667932574025275261==--
