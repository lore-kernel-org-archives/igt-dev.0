Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E47E74AC2
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 16:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B968C10EA9A;
	Tue,  3 Dec 2024 16:38:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D8E10EAA3;
 Tue,  3 Dec 2024 16:37:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0540774596549211819=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/gem=5Fctx=5Fpa?=
 =?utf-8?q?ram=3A_Add_GTT_size_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Dec 2024 16:37:59 -0000
Message-ID: <173324387984.2060734.2355829572847076625@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
In-Reply-To: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
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

--===============0540774596549211819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_ctx_param: Add GTT size test
URL   : https://patchwork.freedesktop.org/series/142041/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8136_full -> XEIGTPW_12234_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12234_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12234_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12234_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][4] ([Intel XE#3468]) -> [DMESG-FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][6] ([Intel XE#3468]) -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12234_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#873])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#2705] / [Intel XE#3468])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#3225] / [Intel XE#3468])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#607])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +11 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +22 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +11 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#3468]) +54 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@kms_color@deep-color.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_color@deep-color.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][25] ([Intel XE#3468]) +14 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-128x128.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][26] ([Intel XE#2705] / [Intel XE#3468])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][27] ([Intel XE#3468]) +54 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2321]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2286]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2291])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-bmg:          [PASS][33] -> [DMESG-FAIL][34] ([Intel XE#3468]) +9 other tests dmesg-fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2425])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2244]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2316])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@kms_flip@2x-busy-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2316]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#2882]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][44] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2635] / [Intel XE#3468])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#3468])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][49] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests incomplete
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2312]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#2333]) +12 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2311]) +32 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2352])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2313]) +40 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2502])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#3374] / [Intel XE#3544])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#346])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2934])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2927])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-bmg:          [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1035] / [Intel XE#3468])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_plane@pixel-format.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_plane@pixel-format.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-bmg:          [PASS][64] -> [DMESG-FAIL][65] ([Intel XE#2705] / [Intel XE#3468])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_plane_lowres@tiling-4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2393])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2493])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][68] ([Intel XE#2566] / [Intel XE#3468])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2763]) +13 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2391])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2392]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2505])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1489]) +12 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2387]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2234] / [Intel XE#2850]) +23 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [PASS][76] -> [DMESG-FAIL][77] ([Intel XE#1727] / [Intel XE#3468])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2330])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#3414]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2413]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2450])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][82] -> [DMESG-WARN][83] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1499])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1091] / [Intel XE#2849])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2504])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2905]) +14 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][88] ([Intel XE#1473]) +1 other test timeout
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2322]) +13 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_basic@twice-null:
    - shard-bmg:          [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1727])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@xe_exec_basic@twice-null.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_exec_basic@twice-null.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#3467])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][94] ([Intel XE#3343] / [Intel XE#3468])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][95] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#1192])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1192])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123]) -> ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [SKIP][148]) ([Intel XE#2457])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-4/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-4/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2245])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2284]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-bmg:          NOTRUN -> [ABORT][151] ([Intel XE#1616] / [Intel XE#3468])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][152] -> [DMESG-WARN][153] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][154] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          NOTRUN -> [ABORT][155] ([Intel XE#3673]) +1 other test abort
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#944]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_vm@mixed-userptr-binds-1611661312:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][157] ([Intel XE#1727])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_vm@mixed-userptr-binds-1611661312.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][158] ([Intel XE#827]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-FAIL][160] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][161] +5 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [DMESG-WARN][162] -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][164] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][166] ([Intel XE#2291]) -> [PASS][167] +2 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][168] ([Intel XE#877]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][170] ([Intel XE#1727] / [Intel XE#2597] / [Intel XE#3468] / [Intel XE#3561]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#2635] / [Intel XE#3468]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-bmg:          [SKIP][174] ([Intel XE#2316]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-bmg:          [DMESG-WARN][176] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@kms_flip@dpms-off-confusion-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][178] ([Intel XE#3468]) -> [PASS][179] +72 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@a-dp2:
    - shard-bmg:          [DMESG-WARN][180] ([Intel XE#1727]) -> [PASS][181] +2 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip@flip-vs-modeset-vs-hang@a-dp2.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_flip@flip-vs-modeset-vs-hang@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [DMESG-FAIL][182] ([Intel XE#3468]) -> [PASS][183] +16 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-x:
    - shard-bmg:          [SKIP][186] -> [PASS][187] +3 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-x.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          [DMESG-FAIL][188] ([Intel XE#2705]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [SKIP][190] ([Intel XE#3665]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [SKIP][192] ([Intel XE#3007]) -> [PASS][193] +3 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-bmg:          [ABORT][194] -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][196] ([Intel XE#1435]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [SKIP][198] ([Intel XE#1130]) -> [PASS][199] +17 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [DMESG-WARN][200] ([Intel XE#3467]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [DMESG-WARN][202] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][204] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-bmg:          [FAIL][206] ([Intel XE#2514]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][208] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@xe_pm@s3-vm-bind-unbind-all.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [DMESG-WARN][210] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][211] +2 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@xe_pm@s4-exec-after.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_async_flips@crc:
    - shard-bmg:          [DMESG-FAIL][212] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][213] ([Intel XE#3468])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@kms_async_flips@crc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][214] ([Intel XE#3557]) -> [DMESG-WARN][215] ([Intel XE#3468])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][216] ([Intel XE#3468]) -> [DMESG-WARN][217] ([Intel XE#3468])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][218] ([Intel XE#3007]) -> [SKIP][219] ([Intel XE#367]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [FAIL][220] -> [DMESG-FAIL][221] ([Intel XE#3468])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][222] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][223] ([Intel XE#2887])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][224] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][225] ([Intel XE#2244])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][226] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][227] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][228] ([Intel XE#2312]) -> [FAIL][229] ([Intel XE#2333]) +6 other tests fail
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][230] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][231] ([Intel XE#2333]) +2 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][232] ([Intel XE#2333]) -> [DMESG-FAIL][233] ([Intel XE#3468]) +6 other tests dmesg-fail
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][234] ([Intel XE#1727] / [Intel XE#2050]) -> [FAIL][235] ([Intel XE#2333])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][236] ([Intel XE#3468]) -> [FAIL][237] ([Intel XE#2333]) +9 other tests fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-bmg:          [SKIP][238] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][239] ([Intel XE#2311])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][240] ([Intel XE#2311]) -> [SKIP][241] ([Intel XE#2312]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][242] ([Intel XE#2312]) -> [SKIP][243] ([Intel XE#2311]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][244] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][245] ([Intel XE#2312])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][246] ([Intel XE#2313]) -> [SKIP][247] ([Intel XE#2312]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][248] ([Intel XE#2312]) -> [SKIP][249] ([Intel XE#2313]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][250] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][251] ([Intel XE#2313]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-bmg:          [SKIP][252] ([Intel XE#3007]) -> [SKIP][253] ([Intel XE#2763])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][254] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][255] ([Intel XE#2938])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][256] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][257] ([Intel XE#1489])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][258] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][259] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [DMESG-WARN][260] ([Intel XE#3468]) -> [SKIP][261] ([Intel XE#1499])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][262] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][263] ([Intel XE#3467]) +1 other test dmesg-warn
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [DMESG-WARN][264] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][265] ([Intel XE#3468])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [ABORT][266] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [ABORT][267] ([Intel XE#1616])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_pm@s2idle-basic-exec.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-bmg:          [ABORT][268] ([Intel XE#3468] / [Intel XE#3673]) -> [ABORT][269] ([Intel XE#3673])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@xe_pm@s2idle-mocs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_pm@s2idle-mocs.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][270] ([Intel XE#3468]) -> [DMESG-WARN][271] ([Intel XE#3467])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3557
  [Intel XE#3561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3561
  [Intel XE#3665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3665
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8136 -> IGTPW_12234

  IGTPW_12234: 9e35f1aaad473ece4c5e63893f99efbe0ee32f93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf12589054127d60b1d36d56ba219

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/index.html

--===============0540774596549211819==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_ctx_param: Add GTT size test=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142041/">https://patchwork.freedesktop.org/series/142041/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12234/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12234/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8136_full -&gt; XEIGTPW_12234_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12234_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12234_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
234_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_exec_basic@many-execqueues-ma=
ny-vm-basic-defer-bind.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12234/shard-bmg-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr.ht=
ml">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_cursor_crc@cursor-onscr=
een-64x64@pipe-a-dp-2.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wopcm_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_fault_inject=
ion@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12234_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-fenci=
ng.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12234/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-fe=
ncing.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/s=
hard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3225">Intel XE#3225</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@kms_color@deep-color.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@=
kms_color@deep-color.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +54 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-1=
28x128.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>) +14 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-1=
28x128@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-2=
56x256@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +54 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2234/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12234/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234=
/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2=
425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-5/igt@kms_flip@2x-busy-flip.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt=
@kms_flip@2x-busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard=
-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-=
a3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12234/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2635">Intel XE#2635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-=
hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12234/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interrup=
tible@b-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#34=
68</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +12 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +32 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +40 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/ig=
t@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7=
/igt@kms_plane_lowres@tiling-4.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
93">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_plane_scaling@planes-upscale=
-factor-0-25.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_psr@psr2-no-drrs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bo=
ttom.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12234/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-croppi=
ng-bottom.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/sh=
ard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_eudebug_online@breakpoint-man=
y-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_evict@evict-mixed-many-thread=
s-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null=
-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2322">Intel XE#2322</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@xe_exec_basic@twice-null.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/=
igt@xe_exec_basic@twice-null.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-x=
e_device_create.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_fault_injection@inject-fault-=
probe-function-xe_device_create.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_fault_injection@inject-fault-=
probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-=
vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +=
1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@x=
e_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
2">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8136/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8136/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8136/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8136/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8136/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8136/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8136/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
136/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8136/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8136/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12234/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12234/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1223=
4/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12234/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12234/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shar=
d-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2234/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12234/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@x=
e_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_pm@s2idle-d3hot-basic-exec.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/i=
gt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel=
 XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2280">Intel XE#2280</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3673">Intel XE#3673</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-binds-1611661312:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_vm@mixed-userptr-binds-161166=
1312.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/82=
7">Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12234/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> +5 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@kms_bw@connected-linear-tiling-1-displays-2560x1=
440p.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-disp=
lays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-f=
lipa-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2597">Intel XE#2597</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3561">Intel XE#3561</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_fl=
ip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2635">Intel XE#2635</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_f=
lip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12234/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb-interruptible.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@kms_flip@dpms-off-confusion-interruptible.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip@dpms-off-co=
nfusion-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi=
-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_flip@dpms-off-confus=
ion-interruptible@b-hdmi-a3.html">PASS</a> +72 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip@flip-vs-modeset-vs-hang@a-dp2.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_flip@flip-vs-modeset-vs-hang@a-dp=
2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-l=
inear-upscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-=
3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-=
a-valid-mode.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
7">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-change=
-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-l=
inear-to-x.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pi=
pe-a-dp-2-linear-to-x.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x=
-to-4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-c=
hange-tiling@pipe-a-dp-2-x-to-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x=
-to-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3665">Intel XE#3665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_flip_tiling@flip-change-=
tiling@pipe-a-dp-2-x-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-u=
pscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_plane_scali=
ng@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> +3 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.ht=
ml">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12234/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12234/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@xe_exec_basic@many-execqueues-null-defer-bind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12234/shard-bmg-7/igt@xe_exec_basic@many-execqueues-null-d=
efer-bind.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-8/igt@xe_fault_i=
njection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/i=
gt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_pt_create.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@xe_fault_inject=
ion@vm-create-fail-xe_pt_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel =
XE#2514</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12234/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbin=
d-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-5/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12234/shard-bmg-5/igt@xe_pm@s4-exec-after.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12234/shard-bmg-6/igt@kms_async_flips@crc.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3557">In=
tel XE#3557</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12234/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-18=
0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-=
stride-64bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
007">Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12234/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs=
@pipe-a-dp-2.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-=
tiled-bmg-ccs@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-r=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_ccs@crc-pr=
imary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bp=
p-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt=
@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
293">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) =
+6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 oth=
er tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"=
>Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +9 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shr=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-6/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12234/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-wi=
th-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12234/shard-bmg-4/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@kms_psr2_sf@pr-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12234/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@kms_vrr@negative-basic.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12234/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-w=
ait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-4=
/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wa_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12234/shard-bmg-5/igt@xe_f=
ault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel=
 XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-7/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12234/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-8/igt@xe_pm@s2idle-mocs.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel=
 XE#3673</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12234/shard-bmg-3/igt@xe_pm@s2idle-mocs.html">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8136/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12234/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">In=
tel XE#3467</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8136 -&gt; IGTPW_12234</li>
</ul>
<p>IGTPW_12234: 9e35f1aaad473ece4c5e63893f99efbe0ee32f93 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf1258905412=
7d60b1d36d56ba219</p>

</body>
</html>

--===============0540774596549211819==--
