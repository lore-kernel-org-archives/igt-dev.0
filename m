Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5C8D70DEB
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 21:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3FA10ED53;
	Thu, 28 Nov 2024 21:12:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D202810ED53;
 Thu, 28 Nov 2024 21:11:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2917479188130650566=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fhangman?=
 =?utf-8?q?=3A_Fix_spin_engine_hang_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Nov 2024 21:11:59 -0000
Message-ID: <173282831982.43182.10537880521242470420@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <tjaif54c4ekuwkevjdspwzv5peoy66ovcyoowaauqv5jbobcv4@p5fvemmwlbhl>
In-Reply-To: <tjaif54c4ekuwkevjdspwzv5peoy66ovcyoowaauqv5jbobcv4@p5fvemmwlbhl>
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

--===============2917479188130650566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_hangman: Fix spin engine hang (rev3)
URL   : https://patchwork.freedesktop.org/series/141694/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8129_full -> XEIGTPW_12216_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12216_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12216_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12216_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][4], [DMESG-WARN][5]) +15 other tests ( 2 dmesg-warn )
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][6] +127 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - shard-bmg:          [PASS][7] -> ([PASS][8], [INCOMPLETE][9]) +3 other tests ( 1 incomplete, 1 pass )
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][12] ([Intel XE#1885]) -> ([ABORT][13], [PASS][14])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@core_hotunplug@hotrebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@core_hotunplug@hotrebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@core_hotunplug@hotrebind.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [SKIP][15] ([Intel XE#2423] / [i915#2575]) -> ([FAIL][16], [FAIL][17])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_async_flips@async-flip-suspend-resume.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#2136] / [Intel XE#2351]) -> ([DMESG-WARN][19], [DMESG-WARN][20])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][21] ([Intel XE#2136]) -> ([DMESG-WARN][22], [DMESG-WARN][23])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][24] ([Intel XE#2136]) -> [DMESG-WARN][25] +3 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][26] ([Intel XE#2136]) -> [ABORT][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_plane@pixel-format:
    - shard-dg2-set2:     [SKIP][28] ([Intel XE#2423] / [i915#2575]) -> ([DMESG-WARN][29], [DMESG-WARN][30]) +1 other test ( 2 dmesg-warn )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane@pixel-format.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane@pixel-format.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane@pixel-format.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][31] ([Intel XE#3467] / [Intel XE#3468]) -> ([SKIP][32], [DMESG-FAIL][33]) ([Intel XE#1130])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  
New tests
---------

  New tests have been introduced between XEIGT_8129_full and XEIGTPW_12216_full:

### New IGT tests (1) ###

  * igt@xe_fault_injection:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12216_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#3249])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@core_getversion@all-cards.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#1885])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][38] -> ([SKIP][39], [PASS][40]) ([Intel XE#2134]) +1 other test ( 1 pass, 1 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@fbdev@nullptr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@fbdev@nullptr.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@fbdev@nullptr.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2134])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@fbdev@unaligned-read.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@fbdev@unaligned-read.html

  * igt@kms_3d:
    - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1727] / [Intel XE#3468])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_3d.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_3d.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#3468]) +5 other tests dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2550]) +23 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#2550]) +11 other tests ( 2 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][50], [DMESG-WARN][51]) ([Intel XE#1727]) +1 other test ( 2 dmesg-warn )
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-lnl:          [PASS][52] -> ([PASS][53], [FAIL][54]) ([Intel XE#1426]) +1 other test ( 1 fail, 1 pass )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][55] -> ([PASS][56], [SKIP][57]) ([Intel XE#2136]) +15 other tests ( 1 pass, 1 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2136]) +29 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#2327])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2136]) +11 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][63] -> ([DMESG-FAIL][64], [PASS][65]) ([Intel XE#3468]) +1 other test ( 1 dmesg-fail, 1 pass )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1124]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#1124] / [Intel XE#2136])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#1124])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#2314] / [Intel XE#2894])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2314] / [Intel XE#2894])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#2136] / [Intel XE#2887]) +4 other tests ( 2 skip )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#787]) +176 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#455] / [Intel XE#787]) +14 other tests ( 2 skip )
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-b-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#787]) +287 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-b-dp-5.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455] / [Intel XE#787]) +63 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-5.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2887]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][84], [DMESG-WARN][85]) ([Intel XE#3468]) +1 other test ( 2 dmesg-warn )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][86], [INCOMPLETE][87]) ([Intel XE#1727] / [Intel XE#3468])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][88] ([Intel XE#1727])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][89] ([Intel XE#1727] / [Intel XE#3113])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#314]) +3 other tests ( 2 skip )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#2252] / [Intel XE#2423])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2252])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#2252]) +1 other test ( 2 skip )
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@ctm-signed@pipe-a-dp-2:
    - shard-bmg:          [PASS][99] -> [INCOMPLETE][100] ([Intel XE#1727]) +1 other test incomplete
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_color@ctm-signed@pipe-a-dp-2.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_color@ctm-signed@pipe-a-dp-2.html

  * igt@kms_color@gamma:
    - shard-bmg:          [PASS][101] -> ([PASS][102], [SKIP][103]) ([Intel XE#2423]) +48 other tests ( 1 pass, 1 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_color@gamma.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_color@gamma.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_color@gamma.html

  * igt@kms_concurrent@multi-plane-atomic-lowres:
    - shard-bmg:          [PASS][104] -> [DMESG-WARN][105] ([Intel XE#1727]) +2 other tests dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_concurrent@multi-plane-atomic-lowres.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_concurrent@multi-plane-atomic-lowres.html

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][106] ([Intel XE#1727])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2.html

  * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][107] ([Intel XE#1727]) +1 other test dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][108], [FAIL][109]) ([Intel XE#1178])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][110] ([Intel XE#3407])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-5.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][111], [FAIL][112]) ([Intel XE#1178] / [Intel XE#2715]) +1 other test ( 1 fail, 1 incomplete )
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_content_protection@legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#1178]) +3 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][114] ([Intel XE#3304])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          NOTRUN -> ([SKIP][115], [INCOMPLETE][116]) ([Intel XE#2423] / [Intel XE#2715] / [Intel XE#3468])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][117] ([Intel XE#2715] / [Intel XE#3468])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2320]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          NOTRUN -> ([SKIP][119], [SKIP][120]) ([Intel XE#2320]) +1 other test ( 2 skip )
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][121] -> ([PASS][122], [SKIP][123]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([Intel XE#2286] / [Intel XE#2423])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][126], [SKIP][127]) ([i915#3804])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2244])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][129] ([Intel XE#3486]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][130] -> ([PASS][131], [DMESG-WARN][132]) ([Intel XE#3468]) +9 other tests ( 1 dmesg-warn, 1 pass )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][133] ([Intel XE#3321] / [Intel XE#3486])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][134] ([Intel XE#301]) +8 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][135] ([Intel XE#2882]) +2 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][136], [DMESG-WARN][137]) ([Intel XE#3468]) +7 other tests ( 2 dmesg-warn )
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-FAIL][138], [DMESG-FAIL][139]) ([Intel XE#3468])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-FAIL][140], [DMESG-FAIL][141]) ([Intel XE#1727] / [Intel XE#3468]) +4 other tests ( 2 dmesg-fail )
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> ([SKIP][142], [PASS][143]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][144] -> ([SKIP][145], [SKIP][146]) ([Intel XE#2316] / [Intel XE#2423]) +1 other test ( 2 skip )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][147] ([Intel XE#301] / [Intel XE#3486])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][148], [FAIL][149]) ([Intel XE#3321] / [Intel XE#3487])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][150], [PASS][151]) ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) +1 other test ( 1 fail, 1 pass )
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][152], [PASS][153]) ([Intel XE#301]) +4 other tests ( 1 fail, 1 pass )
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-rmfb@d-hdmi-a3:
    - shard-bmg:          [PASS][154] -> ([DMESG-WARN][155], [DMESG-WARN][156]) ([Intel XE#3468]) +7 other tests ( 2 dmesg-warn )
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@flip-vs-rmfb@d-hdmi-a3.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@flip-vs-rmfb@d-hdmi-a3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@flip-vs-rmfb@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][157] -> ([DMESG-WARN][158], [PASS][159]) ([Intel XE#3451]) +1 other test ( 1 dmesg-warn, 1 pass )
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - shard-lnl:          [PASS][160] -> ([PASS][161], [FAIL][162]) ([Intel XE#886]) +2 other tests ( 1 fail, 1 pass )
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][163] -> ([FAIL][164], [PASS][165]) ([Intel XE#3149] / [Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][166] -> ([INCOMPLETE][167], [SKIP][168]) ([Intel XE#2423] / [Intel XE#2635])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][169] ([Intel XE#2635])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][170], [SKIP][171]) ([Intel XE#2293]) +1 other test ( 2 skip )
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2380])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#2293] / [Intel XE#2380])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][175], [SKIP][176]) ([Intel XE#455]) +9 other tests ( 2 skip )
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2293]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][178] ([Intel XE#2333]) +3 other tests fail
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][179] ([Intel XE#3468])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][180] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][181], [FAIL][182]) ([Intel XE#2136] / [Intel XE#2333]) +4 other tests ( 1 fail, 1 skip )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([Intel XE#2136] / [Intel XE#2311]) +4 other tests ( 2 skip )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][185], [SKIP][186]) ([Intel XE#2311]) +5 other tests ( 2 skip )
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2311]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][188], [SKIP][189]) ([Intel XE#651])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#2136] / [Intel XE#2352])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#2136] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#2136] / [Intel XE#2312])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2313]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][199], [SKIP][200]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_lease@lease-invalid-connector:
    - shard-bmg:          [PASS][201] -> ([DMESG-WARN][202], [PASS][203]) ([Intel XE#1727]) +1 other test ( 1 dmesg-warn, 1 pass )
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_lease@lease-invalid-connector.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_lease@lease-invalid-connector.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_lease@lease-invalid-connector.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          NOTRUN -> ([SKIP][204], [PASS][205]) ([Intel XE#2423]) +5 other tests ( 1 pass, 1 skip )
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_lease@possible-crtcs-filtering.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:
    - shard-lnl:          [PASS][206] -> ([DMESG-WARN][207], [PASS][208]) ([Intel XE#2055]) +1 other test ( 1 dmesg-warn, 1 pass )
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][209] ([Intel XE#1035] / [Intel XE#3468])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([DMESG-FAIL][210], [DMESG-FAIL][211]) ([Intel XE#3468])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-bmg:          [PASS][212] -> [SKIP][213] ([Intel XE#2423]) +69 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][214], [FAIL][215]) ([Intel XE#616])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#2393])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][218] ([Intel XE#361])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][219], [FAIL][220]) ([Intel XE#361])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][221] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#2423]) +12 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][223] ([Intel XE#2705] / [Intel XE#3468])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#2763]) +14 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#2763]) +5 other tests ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-bmg:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#2423] / [Intel XE#2763]) +1 other test ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][231] ([Intel XE#2763]) +28 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][232] -> ([FAIL][233], [FAIL][234]) ([Intel XE#718])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][235] ([Intel XE#3527])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][236] -> [SKIP][237] ([Intel XE#2446]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     [PASS][238] -> [INCOMPLETE][239] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
    - shard-dg2-set2:     [PASS][240] -> [DMESG-WARN][241] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
    - shard-dg2-set2:     [PASS][242] -> [INCOMPLETE][243] ([Intel XE#1727] / [Intel XE#3468])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][244] -> ([SKIP][245], [PASS][246]) ([Intel XE#2446])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [PASS][247] -> ([DMESG-WARN][248], [DMESG-WARN][249]) ([Intel XE#1727] / [Intel XE#3468])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][250] -> [DMESG-WARN][251] ([Intel XE#2042])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - shard-lnl:          [PASS][252] -> [DMESG-WARN][253] ([Intel XE#3184])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#2387])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#2234] / [Intel XE#2850])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> ([SKIP][259], [SKIP][260]) ([Intel XE#2234] / [Intel XE#2850]) +3 other tests ( 2 skip )
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_psr@pr-sprite-render.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][261], [SKIP][262]) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> ([DMESG-FAIL][263], [PASS][264]) ([Intel XE#3468])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> ([SKIP][265], [SKIP][266]) ([Intel XE#2330] / [Intel XE#2423])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#2423] / [Intel XE#3414]) +1 other test ( 2 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#455]) +5 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][270] -> ([PASS][271], [FAIL][272]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][273] -> [FAIL][274] ([Intel XE#3559]) +3 other tests fail
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([Intel XE#2423] / [Intel XE#2426])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][277] -> ([FAIL][278], [FAIL][279]) ([Intel XE#899])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-bmg:          [PASS][280] -> ([DMESG-WARN][281], [DMESG-FAIL][282]) ([Intel XE#3468]) +2 other tests ( 1 dmesg-fail, 1 dmesg-warn )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_vblank@accuracy-idle.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_vblank@accuracy-idle.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#1499] / [Intel XE#2423])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][285] ([Intel XE#3468]) +1 other test dmesg-warn
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][286] ([Intel XE#1727] / [Intel XE#3468]) +5 other tests dmesg-fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][287] ([Intel XE#1280] / [Intel XE#455])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#1130] / [Intel XE#2504])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - shard-bmg:          [PASS][290] -> [SKIP][291] ([Intel XE#1130]) +131 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#1130] / [Intel XE#2905])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> [SKIP][296] ([Intel XE#2905]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-bmg:          [PASS][297] -> ([DMESG-WARN][298], [SKIP][299]) ([Intel XE#1130] / [Intel XE#3468])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-vm.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_evict@evict-threads-small-multi-vm.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][300], [PASS][301]) ([Intel XE#1130]) +25 other tests ( 1 pass, 1 skip )
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][302] ([Intel XE#3468]) +7 other tests dmesg-warn
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#1130] / [Intel XE#2322])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][305], [SKIP][306]) ([Intel XE#2322]) +2 other tests ( 2 skip )
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-bmg:          NOTRUN -> [SKIP][307] ([Intel XE#1130]) +25 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][308], [SKIP][309]) ([Intel XE#288])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_exec_fault_mode@many-rebind-imm.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind-imm.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][310], [DMESG-WARN][311]) ([Intel XE#3343] / [Intel XE#3468])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][312] ([Intel XE#3467] / [Intel XE#3468])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][313] -> [DMESG-WARN][314] ([Intel XE#3467] / [Intel XE#3468])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][315] -> ([DMESG-WARN][316], [PASS][317]) ([Intel XE#3184])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-dg2-set2:     [PASS][318] -> [TIMEOUT][319] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - shard-lnl:          NOTRUN -> ([SKIP][320], [SKIP][321]) ([Intel XE#2229]) +1 other test ( 2 skip )
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - shard-bmg:          [PASS][322] -> ([PASS][323], [INCOMPLETE][324]) ([Intel XE#2998]) +1 other test ( 1 incomplete, 1 pass )
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][325] ([Intel XE#2833])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][326] -> ([PASS][327], [FAIL][328]) ([Intel XE#3625])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_module_load@many-reload.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_module_load@many-reload.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][329] -> ([DMESG-WARN][330], [DMESG-WARN][331]) ([Intel XE#3467])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_module_load@reload.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_module_load@reload.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_module_load@reload.html

  * igt@xe_oa@syncs-userptr-wait-cfg@rcs-0:
    - shard-bmg:          NOTRUN -> ([DMESG-WARN][332], [PASS][333]) ([Intel XE#3468]) +3 other tests ( 1 dmesg-warn, 1 pass )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_oa@syncs-userptr-wait-cfg@rcs-0.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_oa@syncs-userptr-wait-cfg@rcs-0.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> ([SKIP][334], [SKIP][335]) ([Intel XE#2245])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][336] ([Intel XE#2236])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [PASS][337] -> [DMESG-FAIL][338] ([Intel XE#1727] / [Intel XE#3468])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][339] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][340] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [PASS][341] -> [DMESG-WARN][342] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_pm@s3-basic.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@s3-basic.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][343], [DMESG-WARN][344]) ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> ([SKIP][345], [SKIP][346]) ([Intel XE#944])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][347] -> ([SKIP][348], [PASS][349]) ([Intel XE#1130]) +153 other tests ( 1 pass, 1 skip )
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_query@query-gt-list.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_query@query-gt-list.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_query@query-gt-list.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][350] -> [DMESG-WARN][351] ([Intel XE#3468]) +14 other tests dmesg-warn
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_getclient:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2423]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_getclient.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_getclient.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][354] ([Intel XE#3440]) -> ([PASS][355], [PASS][356]) +1 other test ( 2 pass )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@core_getversion@all-cards.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_getversion@all-cards.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_getversion@all-cards.html

  * igt@core_getversion@basic:
    - shard-bmg:          [FAIL][357] -> ([PASS][358], [PASS][359])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@core_getversion@basic.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@core_getversion@basic.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][360] ([Intel XE#1885]) -> ([PASS][361], [PASS][362])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1885]) -> ([PASS][364], [PASS][365]) +3 other tests ( 2 pass )
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][366] ([Intel XE#3249]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][368] ([Intel XE#3339]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#2423]) -> ([PASS][371], [PASS][372]) +1 other test ( 2 pass )
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_setmaster_vs_auth.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_setmaster_vs_auth.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_setmaster_vs_auth.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2134]) -> ([PASS][374], [PASS][375]) +3 other tests ( 2 pass )
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@fbdev@read.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@fbdev@read.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@fbdev@read.html
    - shard-bmg:          [SKIP][376] ([Intel XE#2134]) -> ([PASS][377], [PASS][378])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@fbdev@read.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@fbdev@read.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@fbdev@read.html

  * igt@kms_addfb_basic@small-bo:
    - shard-bmg:          [SKIP][379] ([Intel XE#2423]) -> [PASS][380] +23 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_addfb_basic@small-bo.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_addfb_basic@small-bo.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][381] ([Intel XE#911]) -> ([PASS][382], [PASS][383]) +3 other tests ( 2 pass )
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#2423] / [i915#2575]) -> ([PASS][385], [PASS][386]) +231 other tests ( 2 pass )
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][387] ([Intel XE#1426]) -> ([PASS][388], [PASS][389]) +1 other test ( 2 pass )
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][390] ([Intel XE#2136]) -> [PASS][391] +2 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][392] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][394] ([Intel XE#2136]) -> ([PASS][395], [PASS][396]) +7 other tests ( 2 pass )
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][397] ([Intel XE#3468]) -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1:
    - shard-lnl:          [FAIL][399] ([Intel XE#2577]) -> ([PASS][400], [PASS][401]) +1 other test ( 2 pass )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2423] / [i915#2575]) -> [PASS][403] +110 other tests pass
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][404] ([Intel XE#3468]) -> [PASS][405] +6 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][406] ([Intel XE#2423]) -> ([PASS][407], [PASS][408]) +32 other tests ( 2 pass )
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][409] ([Intel XE#2316]) -> ([PASS][410], [PASS][411]) +2 other tests ( 2 pass )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][412] ([Intel XE#886]) -> ([PASS][413], [PASS][414]) +1 other test ( 2 pass )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][415] ([Intel XE#2882]) -> ([PASS][416], [PASS][417]) +1 other test ( 2 pass )
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][418] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#2136]) -> [PASS][421] +28 other tests pass
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2136] / [Intel XE#2351]) -> ([PASS][423], [PASS][424]) +20 other tests ( 2 pass )
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2136]) -> ([PASS][426], [PASS][427]) +73 other tests ( 2 pass )
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][429] +23 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [SKIP][430] ([Intel XE#2446]) -> ([PASS][431], [PASS][432])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@dpms-non-lpsp.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2446]) -> ([PASS][434], [PASS][435]) +7 other tests ( 2 pass )
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2446]) -> [PASS][437] +1 other test pass
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
    - shard-bmg:          [INCOMPLETE][438] -> [PASS][439]
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][440] ([Intel XE#899]) -> ([PASS][441], [PASS][442])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@query-forked:
    - shard-bmg:          [DMESG-FAIL][443] ([Intel XE#3468]) -> ([PASS][444], [PASS][445]) +1 other test ( 2 pass )
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_vblank@query-forked.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_vblank@query-forked.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_vblank@query-forked.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [DMESG-WARN][446] ([Intel XE#3468]) -> ([PASS][447], [PASS][448]) +10 other tests ( 2 pass )
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][449] ([Intel XE#1473] / [Intel XE#3468]) -> ([PASS][450], [PASS][451])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          [SKIP][452] ([Intel XE#1130]) -> ([PASS][453], [PASS][454]) +74 other tests ( 2 pass )
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][455] ([Intel XE#1130]) -> [PASS][456] +53 other tests pass
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1130]) -> ([PASS][458], [PASS][459]) +417 other tests ( 2 pass )
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][460] ([Intel XE#3467]) -> ([PASS][461], [PASS][462]) +1 other test ( 2 pass )
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [SKIP][463] ([Intel XE#1192]) -> ([PASS][464], [PASS][465])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@xe_live_ktest@xe_bo.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_live_ktest@xe_bo.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2229]) -> [PASS][467] +1 other test pass
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][468] ([Intel XE#3546]) -> ([PASS][469], [PASS][470])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_module_load@many-reload.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_module_load@many-reload.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][471] ([Intel XE#2514]) -> ([PASS][472], [PASS][473])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          [FAIL][474] ([Intel XE#2514]) -> [PASS][475]
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-WARN][476] ([Intel XE#1727] / [Intel XE#3468]) -> ([PASS][477], [PASS][478])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_pm@s4-basic.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@s4-basic.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@s4-basic.html

  * igt@xe_query@query-gt-list:
    - shard-dg2-set2:     [DMESG-WARN][479] ([Intel XE#1727]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_query@query-gt-list.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_query@query-gt-list.html

  * igt@xe_tlb@basic-tlb:
    - shard-bmg:          [CRASH][481] ([Intel XE#3212]) -> ([PASS][482], [PASS][483])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_tlb@basic-tlb.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_tlb@basic-tlb.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_tlb@basic-tlb.html
    - shard-lnl:          [CRASH][484] ([Intel XE#3212]) -> ([PASS][485], [PASS][486])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@xe_tlb@basic-tlb.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_tlb@basic-tlb.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1130]) -> [PASS][488] +214 other tests pass
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1885]) -> ([DMESG-WARN][490], [DMESG-WARN][491]) ([Intel XE#3467] / [Intel XE#3468])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#1885]) -> ([DMESG-WARN][493], [DMESG-WARN][494]) ([Intel XE#3468]) +1 other test ( 2 dmesg-warn )
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][495] ([Intel XE#2423]) -> [SKIP][496] ([Intel XE#2233])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@unused-modifier:
    - shard-bmg:          [DMESG-WARN][497] ([Intel XE#3468]) -> [SKIP][498] ([Intel XE#2423])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_addfb_basic@unused-modifier.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_addfb_basic@unused-modifier.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#2423] / [i915#2575]) -> [SKIP][500] ([Intel XE#873])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
    - shard-bmg:          [SKIP][501] ([Intel XE#873]) -> [SKIP][502] ([Intel XE#2423])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][503] ([Intel XE#2385]) -> [SKIP][504] ([Intel XE#2423])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][505] ([Intel XE#1701]) -> ([PASS][506], [FAIL][507]) ([Intel XE#1701]) +1 other test ( 1 fail, 1 pass )
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][508] ([Intel XE#3468]) -> [SKIP][509] ([Intel XE#2136])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][510] ([Intel XE#2327]) -> ([SKIP][511], [SKIP][512]) ([Intel XE#2136] / [Intel XE#2327]) +3 other tests ( 2 skip )
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][514] ([Intel XE#316]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][515] ([Intel XE#2136]) -> ([SKIP][516], [SKIP][517]) ([Intel XE#2136] / [Intel XE#2327])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#2136]) -> [INCOMPLETE][519] ([Intel XE#1727] / [Intel XE#402])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2136]) -> [SKIP][521] ([Intel XE#316]) +2 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][523], [SKIP][524]) ([Intel XE#316]) +3 other tests ( 2 skip )
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-bmg:          [SKIP][525] ([Intel XE#2327]) -> [SKIP][526] ([Intel XE#2136])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#2136]) -> [DMESG-WARN][528] ([Intel XE#1727])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-FAIL][529] ([Intel XE#3468]) -> ([PASS][530], [SKIP][531]) ([Intel XE#2136])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][532] ([Intel XE#2136]) -> [DMESG-WARN][533] ([Intel XE#3468])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [SKIP][534] ([Intel XE#2136]) -> ([SKIP][535], [PASS][536]) ([Intel XE#2136]) +5 other tests ( 1 pass, 1 skip )
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#2136]) -> ([SKIP][538], [SKIP][539]) ([Intel XE#316]) +7 other tests ( 2 skip )
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][540] ([Intel XE#2136]) -> ([SKIP][541], [SKIP][542]) ([Intel XE#2327]) +2 other tests ( 2 skip )
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][543] ([Intel XE#2136]) -> [SKIP][544] ([Intel XE#2327])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][545] ([Intel XE#2136]) -> ([SKIP][546], [SKIP][547]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][548] ([Intel XE#1124]) -> ([SKIP][549], [SKIP][550]) ([Intel XE#1124] / [Intel XE#2136]) +8 other tests ( 2 skip )
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][551] ([Intel XE#2136]) -> [SKIP][552] ([Intel XE#1124])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#2136]) -> ([SKIP][554], [SKIP][555]) ([Intel XE#610]) +1 other test ( 2 skip )
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          [SKIP][556] ([Intel XE#2136]) -> [SKIP][557] ([Intel XE#610])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][558] ([Intel XE#1124]) -> [SKIP][559] ([Intel XE#2136]) +4 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#2136]) -> [SKIP][561] ([Intel XE#1124]) +8 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][563], [SKIP][564]) ([Intel XE#1124]) +14 other tests ( 2 skip )
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][566] ([Intel XE#1124]) +4 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#2136]) -> ([SKIP][568], [SKIP][569]) ([Intel XE#1124]) +19 other tests ( 2 skip )
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][571] ([Intel XE#619]) +1 other test skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][572] ([Intel XE#2136]) -> ([SKIP][573], [SKIP][574]) ([Intel XE#1124] / [Intel XE#2136]) +4 other tests ( 2 skip )
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][576], [SKIP][577]) ([Intel XE#367]) +11 other tests ( 2 skip )
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#2423] / [i915#2575]) -> [SKIP][579] ([Intel XE#2191])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][581], [SKIP][582]) ([Intel XE#2191]) +2 other tests ( 2 skip )
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][583] ([Intel XE#2314] / [Intel XE#2894]) -> ([SKIP][584], [SKIP][585]) ([Intel XE#2314] / [Intel XE#2423] / [Intel XE#2894]) +1 other test ( 2 skip )
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][586] ([Intel XE#2423]) -> [SKIP][587] ([Intel XE#2314] / [Intel XE#2894])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#2423] / [i915#2575]) -> [SKIP][589] ([Intel XE#367]) +5 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
    - shard-bmg:          [SKIP][590] ([Intel XE#2423]) -> [SKIP][591] ([Intel XE#367])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][592] ([Intel XE#367]) -> ([SKIP][593], [SKIP][594]) ([Intel XE#2423] / [Intel XE#367]) +3 other tests ( 2 skip )
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][595] ([Intel XE#2423]) -> ([SKIP][596], [SKIP][597]) ([Intel XE#367]) +1 other test ( 2 skip )
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][598] ([Intel XE#367]) -> [SKIP][599] ([Intel XE#2423])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][600] ([Intel XE#2423]) -> ([SKIP][601], [SKIP][602]) ([Intel XE#2423] / [Intel XE#367])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][603] ([Intel XE#2887]) -> ([SKIP][604], [SKIP][605]) ([Intel XE#2136] / [Intel XE#2887]) +10 other tests ( 2 skip )
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#2136]) -> [SKIP][607] ([Intel XE#2907]) +1 other test skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-bmg:          [SKIP][608] ([Intel XE#2136]) -> ([SKIP][609], [SKIP][610]) ([Intel XE#2136] / [Intel XE#2652] / [Intel XE#787])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][612], [SKIP][613]) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#2136]) -> ([SKIP][615], [SKIP][616]) ([Intel XE#455] / [Intel XE#787]) +24 other tests ( 2 skip )
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][618] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-bmg:          [SKIP][619] ([Intel XE#2136]) -> [SKIP][620] ([Intel XE#2887]) +3 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][621] ([Intel XE#2652] / [Intel XE#787]) -> ([SKIP][622], [SKIP][623]) ([Intel XE#2136] / [Intel XE#2652] / [Intel XE#787])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#2136]) -> ([SKIP][625], [SKIP][626]) ([Intel XE#3442]) +1 other test ( 2 skip )
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][627] ([Intel XE#3432]) -> [SKIP][628] ([Intel XE#2136])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#2136]) -> ([INCOMPLETE][630], [INCOMPLETE][631]) ([Intel XE#1727] / [Intel XE#3468])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#2136]) -> [SKIP][633] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
    - shard-bmg:          [SKIP][634] ([Intel XE#2136]) -> [SKIP][635] ([Intel XE#3432])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][636] ([Intel XE#3432]) -> ([SKIP][637], [SKIP][638]) ([Intel XE#2136] / [Intel XE#3432])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][639] ([Intel XE#2136]) -> ([SKIP][640], [SKIP][641]) ([Intel XE#2136] / [Intel XE#2887]) +5 other tests ( 2 skip )
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][642] ([Intel XE#2887]) -> [SKIP][643] ([Intel XE#2136]) +15 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#2136]) -> ([SKIP][645], [SKIP][646]) ([Intel XE#2907]) +5 other tests ( 2 skip )
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][647] ([Intel XE#2136]) -> ([SKIP][648], [SKIP][649]) ([Intel XE#2887]) +7 other tests ( 2 skip )
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][650] ([Intel XE#2136]) -> ([SKIP][651], [SKIP][652]) ([Intel XE#2652] / [Intel XE#787])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][653] ([Intel XE#2423]) -> ([SKIP][654], [SKIP][655]) ([Intel XE#2325] / [Intel XE#2423])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][656] ([Intel XE#2423]) -> [SKIP][657] ([Intel XE#2325])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][658] ([Intel XE#2325]) -> ([SKIP][659], [SKIP][660]) ([Intel XE#2325] / [Intel XE#2423]) +1 other test ( 2 skip )
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][662], [SKIP][663]) ([Intel XE#306]) +3 other tests ( 2 skip )
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][664] ([Intel XE#2423]) -> ([SKIP][665], [SKIP][666]) ([Intel XE#2325]) +1 other test ( 2 skip )
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_color@ctm-negative.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#2423] / [i915#2575]) -> [SKIP][668] ([Intel XE#306]) +2 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][669] ([Intel XE#2325]) -> [SKIP][670] ([Intel XE#2423]) +1 other test skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_chamelium_color@gamma.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][671] ([Intel XE#2423]) -> ([SKIP][672], [SKIP][673]) ([Intel XE#2252]) +6 other tests ( 2 skip )
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][674] ([Intel XE#2252]) -> [SKIP][675] ([Intel XE#2423]) +8 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][676] ([Intel XE#2423]) -> ([SKIP][677], [SKIP][678]) ([Intel XE#2252] / [Intel XE#2423])
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][679] ([Intel XE#2252]) -> ([SKIP][680], [SKIP][681]) ([Intel XE#2252] / [Intel XE#2423]) +10 other tests ( 2 skip )
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][682] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][683], [SKIP][684]) ([Intel XE#373]) +26 other tests ( 2 skip )
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#2423] / [i915#2575]) -> [SKIP][686] ([Intel XE#373]) +10 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_concurrent@multi-plane-atomic-lowres:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][688] ([Intel XE#1727])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_concurrent@multi-plane-atomic-lowres.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_concurrent@multi-plane-atomic-lowres.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][689] ([Intel XE#2423]) -> ([FAIL][690], [FAIL][691]) ([Intel XE#1178])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][692] ([Intel XE#2341]) -> [SKIP][693] ([Intel XE#2423])
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_content_protection@content-type-change.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][694] ([Intel XE#2423] / [i915#2575]) -> [SKIP][695] ([Intel XE#307])
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][696] ([Intel XE#2423]) -> ([SKIP][697], [SKIP][698]) ([Intel XE#2390])
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][699] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][700], [SKIP][701]) ([Intel XE#307]) +3 other tests ( 2 skip )
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
    - shard-bmg:          [SKIP][702] ([Intel XE#2423]) -> ([SKIP][703], [SKIP][704]) ([Intel XE#2390] / [Intel XE#2423])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][705] ([Intel XE#2390]) -> [SKIP][706] ([Intel XE#2423])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#2423] / [i915#2575]) -> ([FAIL][708], [FAIL][709]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_content_protection@legacy.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@legacy.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][710] ([Intel XE#2423]) -> [SKIP][711] ([Intel XE#2341])
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@mei-interface.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][712] ([Intel XE#2423] / [i915#2575]) -> [FAIL][713] ([Intel XE#1178]) +1 other test fail
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_content_protection@srm.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          [FAIL][714] ([Intel XE#1178]) -> [INCOMPLETE][715] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [DMESG-FAIL][716] ([Intel XE#3468]) -> ([SKIP][717], [SKIP][718]) ([Intel XE#2341] / [Intel XE#2423])
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_content_protection@uevent.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_content_protection@uevent.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][719] ([Intel XE#2320]) -> ([SKIP][720], [SKIP][721]) ([Intel XE#2320] / [Intel XE#2423]) +4 other tests ( 2 skip )
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][722] ([Intel XE#2423]) -> [SKIP][723] ([Intel XE#2320])
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][724] ([Intel XE#2423]) -> ([SKIP][725], [SKIP][726]) ([Intel XE#2321] / [Intel XE#2423])
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][727] ([Intel XE#2320]) -> [SKIP][728] ([Intel XE#2423]) +2 other tests skip
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][730], [SKIP][731]) ([Intel XE#308]) +4 other tests ( 2 skip )
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][732] ([Intel XE#2423] / [i915#2575]) -> [SKIP][733] ([Intel XE#308]) +1 other test skip
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-bmg:          [SKIP][734] ([Intel XE#2321]) -> ([SKIP][735], [SKIP][736]) ([Intel XE#2321] / [Intel XE#2423]) +1 other test ( 2 skip )
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-bmg:          [DMESG-FAIL][737] ([Intel XE#3468]) -> ([PASS][738], [SKIP][739]) ([Intel XE#2423])
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x256.html
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          [SKIP][740] ([Intel XE#2423]) -> ([SKIP][741], [SKIP][742]) ([Intel XE#2320])
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x85.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_crc@cursor-random-256x85.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][743] ([Intel XE#2423]) -> ([SKIP][744], [SKIP][745]) ([Intel XE#2320] / [Intel XE#2423]) +1 other test ( 2 skip )
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][746] ([Intel XE#2423]) -> [SKIP][747] ([Intel XE#2321])
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][748] ([Intel XE#2321]) -> [SKIP][749] ([Intel XE#2423]) +2 other tests skip
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][750] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][751], [SKIP][752]) ([Intel XE#323]) +1 other test ( 2 skip )
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-bmg:          [SKIP][753] ([Intel XE#2423]) -> ([SKIP][754], [SKIP][755]) ([Intel XE#2286] / [Intel XE#2423])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][756] ([Intel XE#2286]) -> [SKIP][757] ([Intel XE#2423])
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-bmg:          [DMESG-WARN][758] ([Intel XE#3468]) -> ([SKIP][759], [PASS][760]) ([Intel XE#2423])
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          [INCOMPLETE][761] ([Intel XE#1727] / [Intel XE#3226]) -> ([SKIP][762], [PASS][763]) ([Intel XE#2423])
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][764] ([Intel XE#2423]) -> ([DMESG-WARN][765], [DMESG-WARN][766]) ([Intel XE#877])
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][767] ([Intel XE#877]) -> [SKIP][768] ([Intel XE#2423])
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][769] ([Intel XE#2291]) -> [SKIP][770] ([Intel XE#2423]) +1 other test skip
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][771] ([Intel XE#2423] / [i915#2575]) -> [SKIP][772] ([Intel XE#323])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][773] ([Intel XE#2286]) -> ([SKIP][774], [SKIP][775]) ([Intel XE#2286] / [Intel XE#2423])
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][776] ([Intel XE#1508]) -> ([SKIP][777], [SKIP][778]) ([Intel XE#1508] / [Intel XE#2136])
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2-set2:     [SKIP][779] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][780] ([Intel XE#455]) +1 other test skip
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][781] ([Intel XE#2323]) -> [SKIP][782] ([Intel XE#2423])
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#2136] / [Intel XE#2351]) -> ([DMESG-WARN][784], [INCOMPLETE][785]) ([Intel XE#1727])
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_draw_crc@fill-fb.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_draw_crc@fill-fb.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_draw_crc@fill-fb.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][786] ([Intel XE#2351]) -> ([SKIP][787], [SKIP][788]) ([Intel XE#455])
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_dsc@dsc-basic.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][789] ([Intel XE#2136]) -> [SKIP][790] ([Intel XE#2244])
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][791] ([Intel XE#2136]) -> ([SKIP][792], [SKIP][793]) ([Intel XE#2244]) +1 other test ( 2 skip )
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][794] ([Intel XE#2136]) -> ([SKIP][795], [SKIP][796]) ([Intel XE#2136] / [Intel XE#2244])
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][797] ([Intel XE#2136]) -> ([SKIP][798], [SKIP][799]) ([Intel XE#455]) +11 other tests ( 2 skip )
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][800] ([Intel XE#2136]) -> ([SKIP][801], [FAIL][802]) ([Intel XE#1695] / [Intel XE#2136]) +1 other test ( 1 fail, 1 skip )
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-dg2-set2:     [SKIP][803] ([Intel XE#2136]) -> [INCOMPLETE][804] ([Intel XE#1727] / [Intel XE#3468])
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][805] ([Intel XE#2136]) -> ([SKIP][806], [SKIP][807]) ([Intel XE#776]) +1 other test ( 2 skip )
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][808] ([Intel XE#2136]) -> ([SKIP][809], [SKIP][810]) ([Intel XE#776])
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][811] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][812], [SKIP][813]) ([Intel XE#701])
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][814] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][815], [SKIP][816]) ([Intel XE#1138])
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][817] ([Intel XE#2423] / [i915#2575]) -> [SKIP][818] ([Intel XE#1137])
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          [SKIP][819] ([Intel XE#2375]) -> ([SKIP][820], [SKIP][821]) ([Intel XE#2375] / [Intel XE#2423])
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][822] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][823], [SKIP][824]) ([Intel XE#1135]) +1 other test ( 2 skip )
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][825] ([Intel XE#3468]) -> ([PASS][826], [SKIP][827]) ([Intel XE#2316])
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][828] ([Intel XE#2316]) -> ([SKIP][829], [SKIP][830]) ([Intel XE#2316] / [Intel XE#2423])
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][831] ([Intel XE#2882]) -> ([PASS][832], [DMESG-FAIL][833]) ([Intel XE#3468])
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [SKIP][834] ([Intel XE#2423] / [i915#2575]) -> [FAIL][835] ([Intel XE#301]) +1 other test fail
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][836] ([Intel XE#3486]) -> ([PASS][837], [DMESG-WARN][838]) ([Intel XE#3468])
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][839] ([Intel XE#3321] / [Intel XE#3486]) -> ([FAIL][840], [PASS][841]) ([Intel XE#3321] / [Intel XE#3486])
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][842] ([Intel XE#2423] / [i915#2575]) -> ([DMESG-FAIL][843], [DMESG-FAIL][844]) ([Intel XE#1727] / [Intel XE#3468])
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][845] ([Intel XE#886]) -> ([PASS][846], [FAIL][847]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][848] ([Intel XE#2423] / [i915#2575]) -> ([FAIL][849], [PASS][850]) ([Intel XE#301])
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][851] ([Intel XE#2597]) -> ([SKIP][852], [PASS][853]) ([Intel XE#2423])
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][854] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][855] ([Intel XE#2136]) +4 other tests skip
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][856] ([Intel XE#2136]) -> ([SKIP][857], [SKIP][858]) ([Intel XE#2293] / [Intel XE#2380])
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][859] ([Intel XE#2136]) -> [SKIP][860] ([Intel XE#2293] / [Intel XE#2380])
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][861] ([Intel XE#2293] / [Intel XE#2380]) -> ([SKIP][862], [SKIP][863]) ([Intel XE#2136] / [Intel XE#2293] / [Intel XE#2380]) +3 other tests ( 2 skip )
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][864] ([Intel XE#2136]) -> ([SKIP][865], [SKIP][866]) ([Intel XE#2136] / [Intel XE#2380])
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][867] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][868], [SKIP][869]) ([Intel XE#455]) +4 other tests ( 2 skip )
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][870] ([Intel XE#2136]) -> [SKIP][871] ([Intel XE#455]) +4 other tests skip
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-bmg:          [SKIP][872] ([Intel XE#2136]) -> ([SKIP][873], [SKIP][874]) ([Intel XE#2136] / [Intel XE#2293] / [Intel XE#2380])
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][875] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][876], [SKIP][877]) ([i915#5274])
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][878] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][879] ([Intel XE#651]) +15 other tests skip
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][880] ([Intel XE#2136]) -> ([SKIP][881], [SKIP][882]) ([Intel XE#2136] / [Intel XE#2312]) +4 other tests ( 2 skip )
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][883] ([Intel XE#2136]) -> ([SKIP][884], [SKIP][885]) ([Intel XE#651]) +61 other tests ( 2 skip )
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][886] ([Intel XE#2311]) -> [SKIP][887] ([Intel XE#2136]) +19 other tests skip
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][888] ([Intel XE#2312]) -> ([SKIP][889], [SKIP][890]) ([Intel XE#2311])
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][891] ([Intel XE#2136]) -> ([SKIP][892], [SKIP][893]) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][894] ([Intel XE#2311]) -> ([SKIP][895], [SKIP][896]) ([Intel XE#2311] / [Intel XE#2312]) +5 other tests ( 2 skip )
   [894]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [895]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [896]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][897] ([Intel XE#2136]) -> [SKIP][898] ([Intel XE#2311]) +10 other tests skip
   [897]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [898]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][899] ([Intel XE#2136]) -> [SKIP][900] ([Intel XE#651]) +26 other tests skip
   [899]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [900]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][901] ([Intel XE#2312]) -> [SKIP][902] ([Intel XE#2311]) +1 other test skip
   [901]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [902]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][903] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][904], [SKIP][905]) ([Intel XE#651]) +27 other tests ( 2 skip )
   [903]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [904]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [905]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][906] ([Intel XE#2136]) -> ([SKIP][907], [FAIL][908]) ([Intel XE#2136] / [Intel XE#2333]) +5 other tests ( 1 fail, 1 skip )
   [906]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [907]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [908]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][909] ([Intel XE#3468]) -> [FAIL][910] ([Intel XE#2333])
   [909]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [910]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [FAIL][911] ([Intel XE#2333]) -> ([DMESG-FAIL][912], [FAIL][913]) ([Intel XE#2333] / [Intel XE#3468]) +2 other tests ( 1 dmesg-fail, 1 fail )
   [911]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [912]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [913]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][914] ([Intel XE#2136]) -> [FAIL][915] ([Intel XE#2333]) +2 other tests fail
   [914]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [915]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][916] ([Intel XE#2136]) -> ([DMESG-FAIL][917], [FAIL][918]) ([Intel XE#2333] / [Intel XE#3468])
   [916]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [917]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [918]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][919] ([Intel XE#2136]) -> [DMESG-FAIL][920] ([Intel XE#3468]) +2 other tests dmesg-fail
   [919]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [920]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][921] ([Intel XE#2333]) -> ([FAIL][922], [SKIP][923]) ([Intel XE#2136] / [Intel XE#2333]) +5 other tests ( 1 fail, 1 skip )
   [921]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [922]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [923]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [FAIL][924] ([Intel XE#2333]) -> ([SKIP][925], [SKIP][926]) ([Intel XE#2136] / [Intel XE#2312])
   [924]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [925]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [926]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][927] ([Intel XE#2333]) -> ([FAIL][928], [SKIP][929]) ([Intel XE#2312] / [Intel XE#2333])
   [927]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [928]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [929]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][930] ([Intel XE#2136]) -> ([SKIP][931], [FAIL][932]) ([Intel XE#2312] / [Intel XE#2333]) +1 other test ( 1 fail, 1 skip )
   [930]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [931]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [932]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][933] ([Intel XE#2136]) -> ([FAIL][934], [FAIL][935]) ([Intel XE#2333]) +3 other tests ( 2 fail )
   [933]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [934]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [935]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [FAIL][936] ([Intel XE#2333]) -> [DMESG-FAIL][937] ([Intel XE#3468]) +2 other tests dmesg-fail
   [936]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [937]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][938] ([Intel XE#2136] / [Intel XE#2351]) -> ([INCOMPLETE][939], [INCOMPLETE][940]) ([Intel XE#1727]) +2 other tests ( 2 incomplete )
   [938]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [939]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [940]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][941] ([Intel XE#2312]) -> ([SKIP][942], [DMESG-FAIL][943]) ([Intel XE#2312] / [Intel XE#3468])
   [941]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [942]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [943]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][944] ([Intel XE#2312]) -> [FAIL][945] ([Intel XE#2333])
   [944]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [945]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][946] ([Intel XE#2333]) -> [SKIP][947] ([Intel XE#2136]) +8 other tests skip
   [946]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [947]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-bmg:          [DMESG-WARN][948] ([Intel XE#3468]) -> [SKIP][949] ([Intel XE#2136])
   [948]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [949]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          [FAIL][950] ([Intel XE#2333]) -> ([DMESG-FAIL][951], [DMESG-FAIL][952]) ([Intel XE#3468])
   [950]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [951]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [952]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [DMESG-FAIL][953] ([Intel XE#3468]) -> ([SKIP][954], [FAIL][955]) ([Intel XE#2136] / [Intel XE#2333])
   [953]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [954]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [955]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][956] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][957] ([Intel XE#658])
   [956]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [957]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-bmg:          [SKIP][958] ([Intel XE#2352]) -> [SKIP][959] ([Intel XE#2136])
   [958]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [959]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][960] ([Intel XE#2136]) -> ([SKIP][961], [SKIP][962]) ([Intel XE#2136] / [Intel XE#2311]) +6 other tests ( 2 skip )
   [960]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
   [961]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
   [962]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][963] ([Intel XE#2312]) -> ([SKIP][964], [SKIP][965]) ([Intel XE#2136] / [Intel XE#2311])
   [963]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [964]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [965]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][966] ([Intel XE#2311]) -> ([SKIP][967], [SKIP][968]) ([Intel XE#2136] / [Intel XE#2312]) +1 other test ( 2 skip )
   [966]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [967]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [968]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][969] ([Intel XE#2136]) -> ([SKIP][970], [SKIP][971]) ([Intel XE#2311]) +8 other tests ( 2 skip )
   [969]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [970]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [971]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][972] ([Intel XE#2312]) -> ([SKIP][973], [SKIP][974]) ([Intel XE#2311] / [Intel XE#2312])
   [972]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [973]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [974]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][975] ([Intel XE#2311]) -> ([SKIP][976], [SKIP][977]) ([Intel XE#2136] / [Intel XE#2311]) +24 other tests ( 2 skip )
   [975]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [976]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [977]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][978] ([Intel XE#2136]) -> [SKIP][979] ([Intel XE#2313]) +6 other tests skip
   [978]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [979]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][980] ([Intel XE#2136]) -> [SKIP][981] ([Intel XE#653]) +34 other tests skip
   [980]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [981]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][982] ([Intel XE#2313]) -> ([SKIP][983], [SKIP][984]) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [982]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [983]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [984]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][985] ([Intel XE#2312]) -> ([SKIP][986], [SKIP][987]) ([Intel XE#2136] / [Intel XE#2312]) +1 other test ( 2 skip )
   [985]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [986]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [987]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][988] ([Intel XE#2136]) -> ([SKIP][989], [SKIP][990]) ([Intel XE#2136] / [Intel XE#2313]) +6 other tests ( 2 skip )
   [988]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [989]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [990]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][991] ([Intel XE#2313]) -> [SKIP][992] ([Intel XE#2136]) +21 other tests skip
   [991]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [992]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][993] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][994], [SKIP][995]) ([Intel XE#658])
   [993]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [994]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [995]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][996] ([Intel XE#2350]) -> ([SKIP][997], [SKIP][998]) ([Intel XE#2136] / [Intel XE#2350])
   [996]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [997]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [998]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][999] ([Intel XE#2313]) -> ([SKIP][1000], [SKIP][1001]) ([Intel XE#2136] / [Intel XE#2313]) +20 other tests ( 2 skip )
   [999]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [1000]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [1001]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][1002] ([Intel XE#2136]) -> ([SKIP][1003], [SKIP][1004]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [1002]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [1003]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [1004]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][1005] ([Intel XE#2136]) -> ([SKIP][1006], [SKIP][1007]) ([Intel XE#2313]) +14 other tests ( 2 skip )
   [1005]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [1006]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [1007]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][1008] ([Intel XE#2313]) -> ([SKIP][1009], [SKIP][1010]) ([Intel XE#2136] / [Intel XE#2312])
   [1008]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [1009]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [1010]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][1011] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][1012], [SKIP][1013]) ([Intel XE#653]) +21 other tests ( 2 skip )
   [1011]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [1012]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [1013]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][1014] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][1015] ([Intel XE#653]) +5 other tests skip
   [1014]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [1015]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][1016] ([Intel XE#2312]) -> [SKIP][1017] ([Intel XE#2313]) +1 other test skip
   [1016]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [1017]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][1018] ([Intel XE#2312]) -> ([SKIP][1019], [SKIP][1020]) ([Intel XE#2313]) +2 other tests ( 2 skip )
   [1018]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [1019]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [1020]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][1021] ([Intel XE#2312]) -> [SKIP][1022] ([Intel XE#2136]) +4 other tests skip
   [1021]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [1022]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][1023] ([Intel XE#2136]) -> ([SKIP][1024], [SKIP][1025]) ([Intel XE#653]) +61 other tests ( 2 skip )
   [1023]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [1024]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [1025]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][1026] ([Intel XE#2502]) -> ([SKIP][1027], [SKIP][1028]) ([Intel XE#2423] / [Intel XE#2502])
   [1026]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html
   [1027]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html
   [1028]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][1029] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1030], [SKIP][1031]) ([Intel XE#605])
   [1029]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [1030]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [1031]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-dg2-set2:     [SKIP][1032] ([Intel XE#2423] / [i915#2575]) -> ([DMESG-WARN][1033], [DMESG-WARN][1034]) ([Intel XE#1727]) +2 other tests ( 2 dmesg-warn )
   [1032]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_getfb@getfb2-accept-ccs.html
   [1033]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_getfb@getfb2-accept-ccs.html
   [1034]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][1035] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1036] ([Intel XE#455]) +13 other tests skip
   [1035]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [1036]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][1037] ([Intel XE#346]) -> [SKIP][1038] ([Intel XE#2136])
   [1037]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [1038]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][1039] ([Intel XE#2934]) -> ([SKIP][1040], [SKIP][1041]) ([Intel XE#2136] / [Intel XE#2934])
   [1039]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html
   [1040]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
   [1041]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][1042] ([Intel XE#2136]) -> ([SKIP][1043], [SKIP][1044]) ([Intel XE#346]) +1 other test ( 2 skip )
   [1042]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [1043]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [1044]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          [SKIP][1045] ([Intel XE#346]) -> ([SKIP][1046], [SKIP][1047]) ([Intel XE#2136] / [Intel XE#346])
   [1045]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
   [1046]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
   [1047]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][1048] ([Intel XE#3012]) -> ([PASS][1049], [SKIP][1050]) ([Intel XE#2136])
   [1048]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [1049]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [1050]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][1051] ([Intel XE#2934]) -> [SKIP][1052] ([Intel XE#2136])
   [1051]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [1052]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][1053] ([Intel XE#2136]) -> [SKIP][1054] ([Intel XE#2925])
   [1053]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [1054]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][1055] ([Intel XE#2136]) -> [SKIP][1056] ([Intel XE#2927])
   [1055]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [1056]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][1057] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1058], [SKIP][1059]) ([Intel XE#356])
   [1057]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [1058]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [1059]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][1060] ([Intel XE#2423]) -> [SKIP][1061] ([Intel XE#2486])
   [1060]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [1061]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [SKIP][1062] ([Intel XE#2423] / [i915#2575]) -> ([DMESG-WARN][1063], [DMESG-WARN][1064]) ([Intel XE#2566])
   [1062]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html
   [1063]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane@pixel-format-source-clamping.html
   [1064]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [SKIP][1065] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][1066] ([Intel XE#1035] / [Intel XE#3468])
   [1065]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [1066]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-dg2-set2:     [SKIP][1067] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][1068] ([Intel XE#1035] / [Intel XE#1727])
   [1067]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_plane@plane-position-hole-dpms.html
   [1068]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-bmg:          [SKIP][1069] ([Intel XE#2423]) -> ([DMESG-FAIL][1070], [DMESG-FAIL][1071]) ([Intel XE#3468])
   [1069]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html
   [1070]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-basic.html
   [1071]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [SKIP][1072] ([Intel XE#2423] / [i915#2575]) -> ([FAIL][1073], [FAIL][1074]) ([Intel XE#616])
   [1072]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_plane_cursor@viewport.html
   [1073]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_cursor@viewport.html
   [1074]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][1075] ([Intel XE#2393]) -> [SKIP][1076] ([Intel XE#2423])
   [1075]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
   [1076]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][1077] ([Intel XE#2493]) -> ([SKIP][1078], [SKIP][1079]) ([Intel XE#2423] / [Intel XE#2493]) +1 other test ( 2 skip )
   [1077]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html
   [1078]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html
   [1079]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][1080] ([Intel XE#2423] / [i915#2575]) -> ([FAIL][1081], [FAIL][1082]) ([Intel XE#361])
   [1080]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [1081]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [1082]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-bmg:          [SKIP][1083] ([Intel XE#2423]) -> ([PASS][1084], [DMESG-WARN][1085]) ([Intel XE#3468])
   [1083]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [1084]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [1085]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-bmg:          [SKIP][1086] ([Intel XE#2763]) -> [SKIP][1087] ([Intel XE#2423]) +1 other test skip
   [1086]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [1087]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][1088] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1089] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [1088]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [1089]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-bmg:          [SKIP][1090] ([Intel XE#2423]) -> ([SKIP][1091], [SKIP][1092]) ([Intel XE#2423] / [Intel XE#2763]) +2 other tests ( 2 skip )
   [1090]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [1091]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [1092]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-bmg:          [SKIP][1093] ([Intel XE#2763]) -> ([SKIP][1094], [SKIP][1095]) ([Intel XE#2423] / [Intel XE#2763]) +1 other test ( 2 skip )
   [1093]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [1094]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [1095]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][1096] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1097], [SKIP][1098]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [1096]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [1097]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [1098]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][1099] ([Intel XE#2423]) -> [SKIP][1100] ([Intel XE#2763])
   [1099]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [1100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][1101] ([Intel XE#2136]) -> ([SKIP][1102], [SKIP][1103]) ([Intel XE#870])
   [1101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
   [1102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [1103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg2-set2:     [SKIP][1104] ([Intel XE#2136]) -> [SKIP][1105] ([Intel XE#870]) +1 other test skip
   [1104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
   [1105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][1106] ([Intel XE#2136]) -> ([SKIP][1107], [SKIP][1108]) ([Intel XE#2938])
   [1106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [1107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [1108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][1109] ([Intel XE#2136]) -> ([SKIP][1110], [SKIP][1111]) ([Intel XE#870])
   [1109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
   [1110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
   [1111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][1112] ([Intel XE#2136]) -> [SKIP][1113] ([Intel XE#1129])
   [1112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [1113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
    - shard-bmg:          [SKIP][1114] ([Intel XE#2392]) -> ([SKIP][1115], [SKIP][1116]) ([Intel XE#2136] / [Intel XE#2392])
   [1114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [1115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [1116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][1117] ([Intel XE#2136]) -> ([SKIP][1118], [SKIP][1119]) ([Intel XE#3309])
   [1117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
   [1118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [1119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          [SKIP][1120] ([Intel XE#2136]) -> ([SKIP][1121], [SKIP][1122]) ([Intel XE#3309])
   [1120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html
   [1121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html
   [1122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][1123] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][1124], [SKIP][1125]) ([Intel XE#908])
   [1123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [1124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [1125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          [SKIP][1126] ([Intel XE#2136]) -> ([SKIP][1127], [FAIL][1128]) ([Intel XE#1430] / [Intel XE#2136])
   [1126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
   [1127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
   [1128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][1129] ([Intel XE#1430]) -> ([PASS][1130], [FAIL][1131]) ([Intel XE#1430])
   [1129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [1130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [1131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     [SKIP][1132] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][1133], [SKIP][1134]) ([Intel XE#1129])
   [1132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [1133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
   [1134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][1135] ([Intel XE#2136]) -> ([SKIP][1136], [SKIP][1137]) ([Intel XE#908])
   [1135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [1136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
   [1137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [SKIP][1138] ([Intel XE#2136]) -> [FAIL][1139] ([Intel XE#3527])
   [1138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp.html
   [1139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-bmg:          [SKIP][1140] ([Intel XE#2499]) -> ([SKIP][1141], [SKIP][1142]) ([Intel XE#2136] / [Intel XE#2499])
   [1140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html
   [1141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
   [1142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [SKIP][1143] ([Intel XE#2446]) -> ([INCOMPLETE][1144], [INCOMPLETE][1145]) ([Intel XE#1727] / [Intel XE#3468])
   [1143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@cursor.html
   [1144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_pm_rpm@cursor.html
   [1145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][1146] ([Intel XE#2446]) -> ([SKIP][1147], [SKIP][1148]) ([Intel XE#1439] / [Intel XE#2446] / [Intel XE#3141])
   [1146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html
   [1147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
   [1148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][1149] ([Intel XE#1439]) -> ([SKIP][1150], [SKIP][1151]) ([Intel XE#1439] / [Intel XE#2446])
   [1149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [1150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [1151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][1152] ([Intel XE#2446]) -> ([ABORT][1153], [DMESG-WARN][1154]) ([Intel XE#1727] / [Intel XE#3468])
   [1152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [1153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [1154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-bmg:          [SKIP][1155] ([Intel XE#2446]) -> ([SKIP][1156], [PASS][1157]) ([Intel XE#2446])
   [1155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [1156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [1157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [SKIP][1158] ([Intel XE#2446]) -> [ABORT][1159] ([Intel XE#3468])
   [1158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html
   [1159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-bmg:          [SKIP][1160] ([Intel XE#2446]) -> ([SKIP][1161], [SKIP][1162]) ([Intel XE#1439] / [Intel XE#3141])
   [1160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html
   [1161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [1162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [SKIP][1163] ([Intel XE#2446]) -> ([PASS][1164], [SKIP][1165]) ([Intel XE#3289])
   [1163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [1164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [1165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][1166] ([Intel XE#2446]) -> [DMESG-WARN][1167] ([Intel XE#3468])
   [1166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [1167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [DMESG-WARN][1168] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][1169] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])
   [1168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [1169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [INCOMPLETE][1170] ([Intel XE#2864]) -> ([SKIP][1171], [PASS][1172]) ([Intel XE#2446])
   [1170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_rpm@universal-planes-dpms.html
   [1171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [1172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_prop_blob@invalid-set-prop:
    - shard-bmg:          [SKIP][1173] ([Intel XE#2423]) -> ([PASS][1174], [SKIP][1175]) ([Intel XE#2423]) +36 other tests ( 1 pass, 1 skip )
   [1173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_prop_blob@invalid-set-prop.html
   [1174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_prop_blob@invalid-set-prop.html
   [1175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_prop_blob@invalid-set-prop.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][1176] ([Intel XE#2136]) -> [SKIP][1177] ([Intel XE#1489]) +2 other tests skip
   [1176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [1177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][1178] ([Intel XE#2136]) -> ([SKIP][1179], [SKIP][1180]) ([Intel XE#1489]) +23 other tests ( 2 skip )
   [1178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [1179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [1180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][1181] ([Intel XE#2136]) -> ([SKIP][1182], [SKIP][1183]) ([Intel XE#1489] / [Intel XE#2136]) +1 other test ( 2 skip )
   [1181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [1182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [1183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][1184] ([Intel XE#2136]) -> [SKIP][1185] ([Intel XE#1489]) +11 other tests skip
   [1184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [1185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][1186] ([Intel XE#2136]) -> ([SKIP][1187], [SKIP][1188]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [1186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [1187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [1188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][1189] ([Intel XE#1489]) -> [SKIP][1190] ([Intel XE#2136]) +7 other tests skip
   [1189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [1190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][1191] ([Intel XE#1489]) -> ([SKIP][1192], [SKIP][1193]) ([Intel XE#1489] / [Intel XE#2136]) +8 other tests ( 2 skip )
   [1191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [1192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [1193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][1194] ([Intel XE#2136]) -> ([SKIP][1195], [SKIP][1196]) ([Intel XE#1122]) +1 other test ( 2 skip )
   [1194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [1195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [1196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
    - shard-bmg:          [SKIP][1197] ([Intel XE#2387]) -> [SKIP][1198] ([Intel XE#2136])
   [1197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [1198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][1199] ([Intel XE#2136]) -> [SKIP][1200] ([Intel XE#1122])
   [1199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html
   [1200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][1201] ([Intel XE#2136]) -> ([SKIP][1202], [SKIP][1203]) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests ( 2 skip )
   [1201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html
   [1202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html
   [1203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][1204] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][1205], [SKIP][1206]) ([Intel XE#2850] / [Intel XE#929]) +13 other tests ( 2 skip )
   [1204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr@fbc-pr-no-drrs.html
   [1205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
   [1206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][1207] ([Intel XE#2136]) -> ([SKIP][1208], [SKIP][1209]) ([Intel XE#2850] / [Intel XE#929]) +29 other tests ( 2 skip )
   [1207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [1208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [1209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][1210] ([Intel XE#2136]) -> [SKIP][1211] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
   [1210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html
   [1211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-no-drrs:
    - shard-bmg:          [SKIP][1212] ([Intel XE#2136]) -> [SKIP][1213] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [1212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@pr-no-drrs.html
   [1213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][1214] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][1215] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [1214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html
   [1215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][1216] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][1217] ([Intel XE#2136]) +6 other tests skip
   [1216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_psr@psr-basic.html
   [1217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][1218] ([Intel XE#2351]) -> [SKIP][1219] ([Intel XE#2850] / [Intel XE#929])
   [1218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html
   [1219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][1220] ([Intel XE#2136]) -> ([SKIP][1221], [SKIP][1222]) ([Intel XE#2234] / [Intel XE#2850]) +7 other tests ( 2 skip )
   [1220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@psr-suspend.html
   [1221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_psr@psr-suspend.html
   [1222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][1223] ([Intel XE#2234] / [Intel XE#2850]) -> ([SKIP][1224], [SKIP][1225]) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850]) +12 other tests ( 2 skip )
   [1223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html
   [1224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html
   [1225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][1226] ([Intel XE#2136]) -> ([SKIP][1227], [SKIP][1228]) ([Intel XE#2234])
   [1226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@psr2-primary-render.html
   [1227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [1228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][1229] ([Intel XE#2136] / [Intel XE#2351]) -> ([SKIP][1230], [SKIP][1231]) ([Intel XE#2939])
   [1229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [1230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [1231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][1232] ([Intel XE#2136]) -> ([SKIP][1233], [SKIP][1234]) ([Intel XE#2939])
   [1232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [1233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [1234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][1235] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1236], [SKIP][1237]) ([Intel XE#3414]) +2 other tests ( 2 skip )
   [1235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
   [1236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
   [1237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][1238] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][1239] ([Intel XE#1727])
   [1238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [1239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][1240] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1241] ([Intel XE#1127])
   [1240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [1241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-bmg:          [SKIP][1242] ([Intel XE#2330]) -> ([SKIP][1243], [SKIP][1244]) ([Intel XE#2330] / [Intel XE#2423])
   [1242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [1243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [1244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][1245] ([Intel XE#3414]) -> ([SKIP][1246], [SKIP][1247]) ([Intel XE#2423] / [Intel XE#3414]) +1 other test ( 2 skip )
   [1245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [1246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [1247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][1248] ([Intel XE#2423]) -> [SKIP][1249] ([Intel XE#2330])
   [1248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [1249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][1250] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1251], [SKIP][1252]) ([Intel XE#1127]) +2 other tests ( 2 skip )
   [1250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-bmg:          [SKIP][1253] ([Intel XE#2330]) -> [SKIP][1254] ([Intel XE#2423])
   [1253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][1255] ([Intel XE#3414]) -> [SKIP][1256] ([Intel XE#2423])
   [1255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [1256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][1257] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1258] ([Intel XE#3414]) +4 other tests skip
   [1257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [1258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][1259] ([Intel XE#2423]) -> ([SKIP][1260], [SKIP][1261]) ([Intel XE#2413] / [Intel XE#2423])
   [1259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
   [1260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html
   [1261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][1262] ([Intel XE#2423]) -> ([SKIP][1263], [SKIP][1264]) ([Intel XE#1435])
   [1262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html
   [1263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [1264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][1265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1266] ([Intel XE#1500])
   [1265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [1266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][1267] ([Intel XE#2423]) -> ([SKIP][1268], [SKIP][1269]) ([Intel XE#2423] / [Intel XE#2450])
   [1267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [1268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [1269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][1270] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1271], [SKIP][1272]) ([Intel XE#2168])
   [1270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_vrr@cmrr.html
   [1271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_vrr@cmrr.html
   [1272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][1273] ([Intel XE#2423]) -> ([SKIP][1274], [SKIP][1275]) ([Intel XE#1499])
   [1273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_vrr@flip-basic.html
   [1274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_vrr@flip-basic.html
   [1275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][1276] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1277], [SKIP][1278]) ([Intel XE#455]) +24 other tests ( 2 skip )
   [1276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_vrr@flipline.html
   [1277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_vrr@flipline.html
   [1278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][1279] ([Intel XE#1499]) -> [SKIP][1280] ([Intel XE#2423])
   [1279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_vrr@max-min.html
   [1280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][1281] ([Intel XE#1499]) -> ([SKIP][1282], [SKIP][1283]) ([Intel XE#1499] / [Intel XE#2423])
   [1281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
   [1282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html
   [1283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][1284] ([Intel XE#2423]) -> ([SKIP][1285], [SKIP][1286]) ([Intel XE#1499] / [Intel XE#2423])
   [1284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html
   [1285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html
   [1286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][1287] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1288] ([Intel XE#756]) +1 other test skip
   [1287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [1288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-bmg:          [SKIP][1289] ([Intel XE#2423]) -> ([SKIP][1290], [SKIP][1291]) ([Intel XE#756])
   [1289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [1290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [1291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][1292] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1293], [SKIP][1294]) ([Intel XE#756]) +2 other tests ( 2 skip )
   [1292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [1293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
   [1294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
    - shard-bmg:          [SKIP][1295] ([Intel XE#756]) -> ([SKIP][1296], [SKIP][1297]) ([Intel XE#2423] / [Intel XE#756])
   [1295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_writeback@writeback-fb-id.html
   [1296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html
   [1297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][1298] ([Intel XE#2423] / [i915#2575]) -> ([SKIP][1299], [SKIP][1300]) ([Intel XE#1091] / [Intel XE#2849]) +1 other test ( 2 skip )
   [1298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [1299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [1300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [SKIP][1301] ([Intel XE#1130]) -> [INCOMPLETE][1302] ([Intel XE#1727] / [Intel XE#2771] / [Intel XE#3468])
   [1301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_ccs@suspend-resume.html
   [1302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][1303] ([Intel XE#1130]) -> [SKIP][1304] ([Intel XE#1280] / [Intel XE#455])
   [1303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [1304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][1305] ([Intel XE#1130]) -> ([SKIP][1306], [SKIP][1307]) ([Intel XE#1123]) +1 other test ( 2 skip )
   [1305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [1306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [1307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][1308] ([Intel XE#1130]) -> [SKIP][1309] ([Intel XE#1123])
   [1308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [1309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][1310] ([Intel XE#1130]) -> ([SKIP][1311], [SKIP][1312]) ([Intel XE#1126]) +1 other test ( 2 skip )
   [1310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [1311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [1312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][1313] ([Intel XE#1130]) -> [SKIP][1314] ([Intel XE#1126])
   [1313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [1314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          [SKIP][1315] ([Intel XE#1130]) -> ([SKIP][1316], [SKIP][1317]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [1315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_eudebug@basic-exec-queues-enable.html
   [1316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_eudebug@basic-exec-queues-enable.html
   [1317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][1318] ([Intel XE#2905]) -> [SKIP][1319] ([Intel XE#1130]) +6 other tests skip
   [1318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_eudebug@basic-read-event.html
   [1319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][1320] ([Intel XE#2905]) -> ([SKIP][1321], [SKIP][1322]) ([Intel XE#1130] / [Intel XE#2905]) +6 other tests ( 2 skip )
   [1320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [1321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [1322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          [SKIP][1323] ([Intel XE#1130]) -> [SKIP][1324] ([Intel XE#2905]) +3 other tests skip
   [1323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_eudebug@connect-user.html
   [1324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          [SKIP][1325] ([Intel XE#1130]) -> ([SKIP][1326], [SKIP][1327]) ([Intel XE#1130] / [Intel XE#2905]) +5 other tests ( 2 skip )
   [1325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_eudebug@multigpu-basic-client.html
   [1326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_eudebug@multigpu-basic-client.html
   [1327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     [SKIP][1328] ([Intel XE#1130]) -> ([SKIP][1329], [SKIP][1330]) ([Intel XE#2905]) +37 other tests ( 2 skip )
   [1328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html
   [1329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_eudebug_online@basic-breakpoint.html
   [1330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][1331] ([Intel XE#1130]) -> [SKIP][1332] ([Intel XE#2905]) +14 other tests skip
   [1331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [1332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][1333] ([Intel XE#1130]) -> ([DMESG-FAIL][1334], [DMESG-FAIL][1335]) ([Intel XE#1727])
   [1333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [1334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [1335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-bmg:          [FAIL][1336] ([Intel XE#2364]) -> [DMESG-FAIL][1337] ([Intel XE#1727])
   [1336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [1337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [SKIP][1338] ([Intel XE#1130]) -> ([INCOMPLETE][1339], [INCOMPLETE][1340]) ([Intel XE#1473] / [Intel XE#1727])
   [1338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [1339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [1340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
    - shard-bmg:          [TIMEOUT][1341] ([Intel XE#1473]) -> [INCOMPLETE][1342] ([Intel XE#1473] / [Intel XE#1727])
   [1341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [1342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][1343] ([Intel XE#1130]) -> ([INCOMPLETE][1344], [PASS][1345]) ([Intel XE#1473] / [Intel XE#402])
   [1343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [1344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [1345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
    - shard-bmg:          [INCOMPLETE][1346] ([Intel XE#1473]) -> ([SKIP][1347], [FAIL][1348]) ([Intel XE#1000] / [Intel XE#1130])
   [1346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [1347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [1348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][1349] ([Intel XE#1473]) -> [SKIP][1350] ([Intel XE#1130])
   [1349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html
   [1350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     [SKIP][1351] ([Intel XE#1130]) -> ([TIMEOUT][1352], [TIMEOUT][1353]) ([Intel XE#1473])
   [1351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
   [1352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
   [1353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][1354] ([Intel XE#1130]) -> ([PASS][1355], [INCOMPLETE][1356]) ([Intel XE#1473])
   [1354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [1355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [1356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-basic:
    - shard-bmg:          [DMESG-WARN][1357] ([Intel XE#3468]) -> ([PASS][1358], [SKIP][1359]) ([Intel XE#1130])
   [1357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_exec_basic@many-execqueues-basic.html
   [1358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exec_basic@many-execqueues-basic.html
   [1359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-execqueues-basic.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][1360] ([Intel XE#3468]) -> [SKIP][1361] ([Intel XE#1130]) +1 other test skip
   [1360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
   [1361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][1362] ([Intel XE#1130]) -> [DMESG-WARN][1363] ([Intel XE#1727]) +2 other tests dmesg-warn
   [1362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [1363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [SKIP][1364] ([Intel XE#1130]) -> ([SKIP][1365], [PASS][1366]) ([Intel XE#1130]) +52 other tests ( 1 pass, 1 skip )
   [1364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [1365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [1366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [SKIP][1367] ([Intel XE#1130]) -> ([SKIP][1368], [SKIP][1369]) ([Intel XE#1130] / [Intel XE#2322]) +2 other tests ( 2 skip )
   [1367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [1368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [1369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][1370] ([Intel XE#2322]) -> ([SKIP][1371], [SKIP][1372]) ([Intel XE#1130] / [Intel XE#2322]) +7 other tests ( 2 skip )
   [1370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [1371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [1372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][1373] ([Intel XE#1130]) -> [SKIP][1374] ([Intel XE#2322]) +2 other tests skip
   [1373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [1374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][1375] ([Intel XE#2322]) -> [SKIP][1376] ([Intel XE#1130]) +8 other tests skip
   [1375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [1376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][1377] ([Intel XE#1130]) -> ([SKIP][1378], [SKIP][1379]) ([Intel XE#2322]) +1 other test ( 2 skip )
   [1377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [1378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [1379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][1380] ([Intel XE#1130]) -> [DMESG-WARN][1381] ([Intel XE#1727]) +4 other tests dmesg-warn
   [1380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html
   [1381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][1382] ([Intel XE#1130]) -> ([SKIP][1383], [SKIP][1384]) ([Intel XE#288]) +71 other tests ( 2 skip )
   [1382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [1383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [1384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][1385] ([Intel XE#1130]) -> [SKIP][1386] ([Intel XE#288]) +36 other tests skip
   [1385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [1386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][1387] ([Intel XE#1130]) -> ([SKIP][1388], [SKIP][1389]) ([Intel XE#2360]) +2 other tests ( 2 skip )
   [1387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [1388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [1389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension:
    - shard-bmg:          [SKIP][1390] ([Intel XE#1130]) -> ([DMESG-WARN][1391], [DMESG-WARN][1392]) ([Intel XE#3468])
   [1390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exercise_blt@fast-copy-inc-dimension.html
   [1391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_exercise_blt@fast-copy-inc-dimension.html
   [1392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exercise_blt@fast-copy-inc-dimension.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [SKIP][1393] ([Intel XE#1130]) -> ([DMESG-WARN][1394], [DMESG-WARN][1395]) ([Intel XE#3343]) +3 other tests ( 2 dmesg-warn )
   [1393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [1394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [1395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [SKIP][1396] ([Intel XE#1130]) -> [DMESG-WARN][1397] ([Intel XE#3343])
   [1396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [1397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
    - shard-bmg:          [DMESG-WARN][1398] ([Intel XE#3343]) -> ([DMESG-WARN][1399], [PASS][1400]) ([Intel XE#3343])
   [1398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [1399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [1400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [SKIP][1401] ([Intel XE#1130]) -> [DMESG-WARN][1402] ([Intel XE#3343])
   [1401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [1402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [SKIP][1403] ([Intel XE#1130]) -> ([SKIP][1404], [FAIL][1405]) ([Intel XE#1130] / [Intel XE#3499])
   [1403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [1404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [1405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][1406] ([Intel XE#3499]) -> ([SKIP][1407], [FAIL][1408]) ([Intel XE#1130] / [Intel XE#3499])
   [1406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [1407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [1408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-FAIL][1409] ([Intel XE#3467] / [Intel XE#3468]) -> ([SKIP][1410], [FAIL][1411]) ([Intel XE#1130] / [Intel XE#3499])
   [1409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [1410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [1411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [SKIP][1412] ([Intel XE#1130]) -> ([DMESG-WARN][1413], [DMESG-WARN][1414]) ([Intel XE#3467]) +6 other tests ( 2 dmesg-warn )
   [1412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [1413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [1414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
    - shard-bmg:          [SKIP][1415] ([Intel XE#1130]) -> ([FAIL][1416], [FAIL][1417]) ([Intel XE#3499])
   [1415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [1416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [1417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [SKIP][1418] ([Intel XE#1130]) -> [DMESG-WARN][1419] ([Intel XE#3467]) +6 other tests dmesg-warn
   [1418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [1419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][1420] ([Intel XE#1130]) -> ([SKIP][1421], [SKIP][1422]) ([Intel XE#255])
   [1420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
   [1421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
   [1422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-bmg:          [SKIP][1423] ([Intel XE#2229]) -> ([PASS][1424], [SKIP][1425]) ([Intel XE#2229])
   [1423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [1424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [1425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][1426] ([Intel XE#1999]) -> ([SKIP][1427], [SKIP][1428]) ([Intel XE#1192])
   [1426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html
   [1427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html
   [1428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][1429] ([Intel XE#1130]) -> ([SKIP][1430], [SKIP][1431]) ([Intel XE#560])
   [1429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [1430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [1431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_media_fill@media-fill.html
    - shard-bmg:          [SKIP][1432] ([Intel XE#1130]) -> ([SKIP][1433], [SKIP][1434]) ([Intel XE#2459] / [Intel XE#2596])
   [1432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [1433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_media_fill@media-fill.html
   [1434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][1435] ([Intel XE#1130]) -> ([SKIP][1436], [SKIP][1437]) ([Intel XE#586])
   [1435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_mmap@small-bar.html
   [1436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_mmap@small-bar.html
   [1437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][1438] ([Intel XE#3625]) -> ([PASS][1439], [FAIL][1440]) ([Intel XE#3625])
   [1438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [1439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [1440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [FAIL][1441] ([Intel XE#3546]) -> ([DMESG-WARN][1442], [DMESG-WARN][1443]) ([Intel XE#3467])
   [1441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [1442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_module_load@reload-no-display.html
   [1443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_module_load@reload-no-display.html

  * igt@xe_module_load@unload:
    - shard-bmg:          [DMESG-WARN][1444] -> ([DMESG-WARN][1445], [DMESG-WARN][1446]) ([Intel XE#3467])
   [1444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_module_load@unload.html
   [1445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_module_load@unload.html
   [1446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_module_load@unload.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][1447] ([Intel XE#1130]) -> [SKIP][1448] ([Intel XE#3573]) +12 other tests skip
   [1447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html
   [1448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@oa-exponents:
    - shard-bmg:          [SKIP][1449] ([Intel XE#1130]) -> [DMESG-WARN][1450] ([Intel XE#3468]) +3 other tests dmesg-warn
   [1449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_oa@oa-exponents.html
   [1450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][1451] ([Intel XE#1130]) -> ([SKIP][1452], [SKIP][1453]) ([Intel XE#3573]) +17 other tests ( 2 skip )
   [1451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html
   [1452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html
   [1453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-bmg:          [SKIP][1454] ([Intel XE#1130]) -> ([DMESG-WARN][1455], [PASS][1456]) ([Intel XE#3468]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [1454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_oa@syncs-userptr-wait-cfg.html
   [1455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_oa@syncs-userptr-wait-cfg.html
   [1456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][1457] ([Intel XE#2248]) -> [SKIP][1458] ([Intel XE#1130]) +1 other test skip
   [1457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html
   [1458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][1459] ([Intel XE#1130]) -> ([SKIP][1460], [SKIP][1461]) ([Intel XE#979])
   [1459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [1460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [1461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][1462] ([Intel XE#1130]) -> ([ABORT][1463], [ABORT][1464]) ([Intel XE#1358] / [Intel XE#3468])
   [1462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
   [1463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
   [1464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][1465] ([Intel XE#2284]) -> ([SKIP][1466], [SKIP][1467]) ([Intel XE#1130] / [Intel XE#2284])
   [1465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html
   [1466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_pm@d3cold-mmap-system.html
   [1467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][1468] ([Intel XE#1130]) -> [SKIP][1469] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [1468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [1469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][1470] ([Intel XE#1130]) -> ([SKIP][1471], [SKIP][1472]) ([Intel XE#2284])
   [1470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [1471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pm@d3cold-mocs.html
   [1472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][1473] ([Intel XE#2284]) -> [SKIP][1474] ([Intel XE#1130]) +1 other test skip
   [1473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html
   [1474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html
    - shard-dg2-set2:     [SKIP][1475] ([Intel XE#1130]) -> ([SKIP][1476], [SKIP][1477]) ([Intel XE#2284] / [Intel XE#366]) +2 other tests ( 2 skip )
   [1475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
   [1476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html
   [1477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][1478] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][1479] ([Intel XE#1727] / [Intel XE#3468])
   [1478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html
   [1479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][1480] ([Intel XE#1130]) -> ([DMESG-WARN][1481], [DMESG-WARN][1482]) ([Intel XE#1727] / [Intel XE#3468]) +4 other tests ( 2 dmesg-warn )
   [1480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html
   [1481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html
   [1482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][1483] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [SKIP][1484] ([Intel XE#1130])
   [1483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html
   [1484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][1485] ([Intel XE#1130]) -> [SKIP][1486] ([Intel XE#2284])
   [1485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html
   [1486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          [SKIP][1487] ([Intel XE#1130]) -> [DMESG-WARN][1488] ([Intel XE#1727] / [Intel XE#3468])
   [1487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_pm@s4-multiple-execs.html
   [1488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [SKIP][1489] ([Intel XE#1130]) -> [DMESG-WARN][1490] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [1489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
   [1490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][1491] ([Intel XE#1130]) -> ([SKIP][1492], [SKIP][1493]) ([Intel XE#579])
   [1491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [1492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
   [1493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          [SKIP][1494] ([Intel XE#579]) -> [SKIP][1495] ([Intel XE#1130])
   [1494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html
   [1495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [SKIP][1496] ([Intel XE#1130]) -> ([DMESG-WARN][1497], [DMESG-WARN][1498]) ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])
   [1496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [1497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [1498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][1499] ([Intel XE#958]) -> ([PASS][1500], [FAIL][1501]) ([Intel XE#958])
   [1499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [1500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [1501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][1502] ([Intel XE#1130]) -> [SKIP][1503] ([Intel XE#944]) +5 other tests skip
   [1502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
   [1503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][1504] ([Intel XE#1130]) -> ([SKIP][1505], [SKIP][1506]) ([Intel XE#944]) +6 other tests ( 2 skip )
   [1504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [1505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [1506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
    - shard-bmg:          [SKIP][1507] ([Intel XE#1130]) -> ([SKIP][1508], [SKIP][1509]) ([Intel XE#944])
   [1507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_query@multigpu-query-engines.html
   [1508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_query@multigpu-query-engines.html
   [1509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][1510] ([Intel XE#944]) -> ([SKIP][1511], [SKIP][1512]) ([Intel XE#1130] / [Intel XE#944]) +2 other tests ( 2 skip )
   [1510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [1511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [1512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][1513] ([Intel XE#1130]) -> [SKIP][1514] ([Intel XE#944])
   [1513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html
   [1514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          [SKIP][1515] ([Intel XE#1130]) -> ([SKIP][1516], [SKIP][1517]) ([Intel XE#1130] / [Intel XE#944])
   [1515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [1516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [1517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][1518] ([Intel XE#1130]) -> [SKIP][1519] ([Intel XE#3342])
   [1518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
   [1519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][1520] ([Intel XE#1130]) -> ([SKIP][1521], [SKIP][1522]) ([Intel XE#3342])
   [1520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html
   [1521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [1522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [SKIP][1523] ([Intel XE#1130]) -> ([FAIL][1524], [FAIL][1525]) ([Intel XE#2922])
   [1523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_tlb@basic-tlb.html
   [1524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_tlb@basic-tlb.html
   [1525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@large-misaligned-binds-16777216:
    - shard-dg2-set2:     [SKIP][1526] ([Intel XE#1130]) -> ([DMESG-WARN][1527], [DMESG-WARN][1528]) ([Intel XE#1727]) +2 other tests ( 2 dmesg-warn )
   [1526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_vm@large-misaligned-binds-16777216.html
   [1527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_vm@large-misaligned-binds-16777216.html
   [1528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_vm@large-misaligned-binds-16777216.html

  * igt@xe_vm@large-userptr-misaligned-binds-536870912:
    - shard-dg2-set2:     [SKIP][1529] ([Intel XE#1130]) -> ([DMESG-WARN][1530], [PASS][1531]) ([Intel XE#1727])
   [1529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_vm@large-userptr-misaligned-binds-536870912.html
   [1530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_vm@large-userptr-misaligned-binds-536870912.html
   [1531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_vm@large-userptr-misaligned-binds-536870912.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-2097152:
    - shard-bmg:          [DMESG-WARN][1532] ([Intel XE#1727]) -> ([SKIP][1533], [PASS][1534]) ([Intel XE#1130])
   [1532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html
   [1533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html
   [1534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_vm@large-userptr-split-misaligned-binds-2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/index.html

--===============2917479188130650566==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_hangman: Fix spin engine hang (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141694/">https://patchwork.freedesktop.org/series/141694/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8129_full -&gt; XEIGTPW_12216_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12216_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12216_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12216_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a>) +15 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc.html">DMESG-WARN</a> +127 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html">INCOMPLETE</a>) +3 other tests ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@core_hotunplug@hotrebind.html">SKIP</a> ([Intel XE#1885]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@core_hotunplug@hotrebind.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@core_hotunplug@hotrebind.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane@pixel-format.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane@pixel-format.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane@pixel-format.html">DMESG-WARN</a>) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> ([Intel XE#3467] / [Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a>) ([Intel XE#1130])</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8129_full and XEIGTPW_12216_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_fault_injection:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12216_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@core_getversion@all-cards.html">FAIL</a> ([Intel XE#3249])</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@core_hotunplug@hotreplug.html">SKIP</a> ([Intel XE#1885])</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@fbdev@nullptr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@fbdev@nullptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@fbdev@nullptr.html">PASS</a>) ([Intel XE#2134]) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@fbdev@unaligned-read.html">SKIP</a> ([Intel XE#2134])</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_3d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_3d.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">DMESG-FAIL</a> ([Intel XE#3468]) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html">SKIP</a> ([Intel XE#2550]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a>) ([Intel XE#2550]) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">DMESG-WARN</a>) ([Intel XE#1727]) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a>) ([Intel XE#1426]) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>) ([Intel XE#2136]) +15 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> ([Intel XE#2136]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a>) ([Intel XE#2327])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([Intel XE#2136]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a>) ([Intel XE#3468]) +1 other test ( 1 dmesg-fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> ([Intel XE#1124]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a>) ([Intel XE#1124] / [Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>) ([Intel XE#1124])</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>) ([Intel XE#2314] / [Intel XE#2894])</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> ([Intel XE#2314] / [Intel XE#2894])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2887]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a>) ([Intel XE#787]) +176 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a>) ([Intel XE#455] / [Intel XE#787]) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-b-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-b-dp-5.html">SKIP</a> ([Intel XE#787]) +287 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-5.html">SKIP</a> ([Intel XE#455] / [Intel XE#787]) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> ([Intel XE#2887]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a>) ([Intel XE#3468]) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a>) ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5.html">INCOMPLETE</a> ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#3113])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a>) ([Intel XE#314]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a>) ([Intel XE#2252] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> ([Intel XE#2252])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a>) ([Intel XE#2252]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_color@ctm-signed@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_color@ctm-signed@pipe-a-dp-2.html">INCOMPLETE</a> ([Intel XE#1727]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_color@gamma.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_color@gamma.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_color@gamma.html">SKIP</a>) ([Intel XE#2423]) +48 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_concurrent@multi-plane-atomic-lowres.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_concurrent@multi-plane-atomic-lowres.html">DMESG-WARN</a> ([Intel XE#1727]) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2.html">DMESG-WARN</a> ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6.html">DMESG-WARN</a> ([Intel XE#1727]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>) ([Intel XE#1178])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-5.html">FAIL</a> ([Intel XE#3407])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_content_protection@legacy.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_content_protection@legacy.html">FAIL</a>) ([Intel XE#1178] / [Intel XE#2715]) +1 other test ( 1 fail, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> ([Intel XE#1178]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html">FAIL</a> ([Intel XE#3304])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a>) ([Intel XE#2423] / [Intel XE#2715] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">INCOMPLETE</a> ([Intel XE#2715] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> ([Intel XE#2320]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a>) ([Intel XE#2320]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>) ([Intel XE#2286] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> ([Intel XE#2244])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> ([Intel XE#3486]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">DMESG-WARN</a>) ([Intel XE#3468]) +9 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> ([Intel XE#3321] / [Intel XE#3486])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> ([Intel XE#301]) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> ([Intel XE#2882]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">DMESG-WARN</a>) ([Intel XE#3468]) +7 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-FAIL</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">DMESG-FAIL</a>) ([Intel XE#1727] / [Intel XE#3468]) +4 other tests ( 2 dmesg-fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a>) ([Intel XE#2316] / [Intel XE#2423]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> ([Intel XE#301] / [Intel XE#3486])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a>) ([Intel XE#3321] / [Intel XE#3487])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a>) ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a>) ([Intel XE#301]) +4 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@flip-vs-rmfb@d-hdmi-a3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@flip-vs-rmfb@d-hdmi-a3.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@flip-vs-rmfb@d-hdmi-a3.html">DMESG-WARN</a>) ([Intel XE#3468]) +7 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html">PASS</a>) ([Intel XE#3451]) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">FAIL</a>) ([Intel XE#886]) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a>) ([Intel XE#3149] / [Intel XE#886]) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2635])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2.html">INCOMPLETE</a> ([Intel XE#2635])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>) ([Intel XE#2293]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([Intel XE#2380])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a>) ([Intel XE#2293] / [Intel XE#2380])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>) ([Intel XE#455]) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([Intel XE#2293]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> ([Intel XE#2333]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">DMESG-FAIL</a> ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a>) ([Intel XE#2136] / [Intel XE#2333]) +4 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2311]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) ([Intel XE#2311]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> ([Intel XE#2311]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a>) ([Intel XE#651])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2352])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2313]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2312])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> ([Intel XE#2313]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) ([Intel XE#2313]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_lease@lease-invalid-connector.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_lease@lease-invalid-connector.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_lease@lease-invalid-connector.html">PASS</a>) ([Intel XE#1727]) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_lease@possible-crtcs-filtering.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_lease@possible-crtcs-filtering.html">PASS</a>) ([Intel XE#2423]) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html">PASS</a>) ([Intel XE#2055]) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> ([Intel XE#1035] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2.html">DMESG-FAIL</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.html">SKIP</a> ([Intel XE#2423]) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a>) ([Intel XE#616])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a>) ([Intel XE#2393])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> ([Intel XE#361])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a>) ([Intel XE#361])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> ([Intel XE#2423]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">DMESG-WARN</a> ([Intel XE#2705] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> ([Intel XE#2763]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a>) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a>) ([Intel XE#2763]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2763]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> ([Intel XE#2763]) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>) ([Intel XE#718])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html">FAIL</a> ([Intel XE#3527])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> ([Intel XE#2446]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a>) ([Intel XE#2446])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a>) ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> ([Intel XE#2042])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">DMESG-WARN</a> ([Intel XE#3184])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>) ([Intel XE#1489]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>) ([Intel XE#2387])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> ([Intel XE#2234] / [Intel XE#2850])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_psr@pr-sprite-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a>) ([Intel XE#2234] / [Intel XE#2850]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">PASS</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>) ([Intel XE#2330] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#3414]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> ([Intel XE#455]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a>) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a> ([Intel XE#3559]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2426])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a>) ([Intel XE#899])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_vblank@accuracy-idle.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_vblank@accuracy-idle.html">DMESG-FAIL</a>) ([Intel XE#3468]) +2 other tests ( 1 dmesg-fail, 1 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) ([Intel XE#1499] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">DMESG-WARN</a> ([Intel XE#3468]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html">DMESG-FAIL</a> ([Intel XE#1727] / [Intel XE#3468]) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> ([Intel XE#1280] / [Intel XE#455])</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2504])</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">SKIP</a> ([Intel XE#1130]) +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2905])</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a>) ([Intel XE#2905]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_eudebug_online@resume-one.html">SKIP</a> ([Intel XE#2905]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-vm.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_evict@evict-threads-small-multi-vm.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a>) ([Intel XE#1130]) +25 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue.html">DMESG-WARN</a> ([Intel XE#3468]) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2322])</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a>) ([Intel XE#2322]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> ([Intel XE#1130]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_exec_fault_mode@many-rebind-imm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind-imm.html">SKIP</a>) ([Intel XE#288])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a>) ([Intel XE#3343] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> ([Intel XE#3467] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> ([Intel XE#3467] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a>) ([Intel XE#3184])</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">TIMEOUT</a> ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">SKIP</a>) ([Intel XE#2229]) +1 other test ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a>) ([Intel XE#2998]) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> ([Intel XE#2833])</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_module_load@many-reload.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_module_load@many-reload.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_module_load@many-reload.html">FAIL</a>) ([Intel XE#3625])</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_module_load@reload.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_module_load@reload.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_module_load@reload.html">DMESG-WARN</a>) ([Intel XE#3467])</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_oa@syncs-userptr-wait-cfg@rcs-0.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_oa@syncs-userptr-wait-cfg@rcs-0.html">PASS</a>) ([Intel XE#3468]) +3 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_pat@pat-index-xelp.html">SKIP</a>) ([Intel XE#2245])</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a> ([Intel XE#2236])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html">DMESG-FAIL</a> ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@s3-basic.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a>) ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a>) ([Intel XE#944])</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_query@query-gt-list.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_query@query-gt-list.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_query@query-gt-list.html">PASS</a>) ([Intel XE#1130]) +153 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">DMESG-WARN</a> ([Intel XE#3468]) +14 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_getclient.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_getclient.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> ([Intel XE#3440]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_getversion@all-cards.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@core_getversion@basic.html">FAIL</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@core_getversion@basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@core_getversion@basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> ([Intel XE#1885]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> ([Intel XE#1885]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> ([Intel XE#3249]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html">FAIL</a> ([Intel XE#3339]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster_vs_auth:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_setmaster_vs_auth.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@core_setmaster_vs_auth.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_setmaster_vs_auth.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@fbdev@read.html">SKIP</a> ([Intel XE#2134]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@fbdev@read.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@fbdev@read.html">PASS</a>) +3 other tests ( 2 pass )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@fbdev@read.html">SKIP</a> ([Intel XE#2134]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@fbdev@read.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@fbdev@read.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_addfb_basic@small-bo.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_addfb_basic@small-bo.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> ([Intel XE#911]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a>) +231 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> ([Intel XE#1426]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> ([Intel XE#2314] / [Intel XE#2894]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a>) +7 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html">FAIL</a> ([Intel XE#2577]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +110 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a>) +32 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([Intel XE#2316]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([Intel XE#886]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">FAIL</a> ([Intel XE#2882]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> ([Intel XE#2597] / [Intel XE#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a>) +20 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a>) +73 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>) +7 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html">SKIP</a> ([Intel XE#2446]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-77:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> ([Intel XE#899]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_vblank@query-forked.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_vblank@query-forked.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_vblank@query-forked.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_ccs@ctrl-surf-copy-new-ctx@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a>) +10 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> ([Intel XE#1473] / [Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a>) +74 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a>) +417 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> ([Intel XE#3467]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> ([Intel XE#1192]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_live_ktest@xe_bo.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> ([Intel XE#2229]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_module_load@many-reload.html">FAIL</a> ([Intel XE#3546]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_module_load@many-reload.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_module_load@many-reload.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> ([Intel XE#2514]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> ([Intel XE#2514]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_pm@s4-basic.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@s4-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@s4-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_query@query-gt-list.html">DMESG-WARN</a> ([Intel XE#1727]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_query@query-gt-list.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_tlb@basic-tlb.html">CRASH</a> ([Intel XE#3212]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_tlb@basic-tlb.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_tlb@basic-tlb.html">PASS</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@xe_tlb@basic-tlb.html">CRASH</a> ([Intel XE#3212]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@xe_tlb@basic-tlb.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@xe_tlb@basic-tlb.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +214 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> ([Intel XE#1885]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a>) ([Intel XE#3467] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> ([Intel XE#1885]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a>) ([Intel XE#3468]) +1 other test ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([Intel XE#2233])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_addfb_basic@unused-modifier.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_addfb_basic@unused-modifier.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([Intel XE#873])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([Intel XE#873]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([Intel XE#2385]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> ([Intel XE#1701]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a>) ([Intel XE#1701]) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([Intel XE#2327]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2327]) +3 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([Intel XE#316]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2327])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#402])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> ([Intel XE#316]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>) ([Intel XE#316]) +3 other tests ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([Intel XE#2327]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">DMESG-WARN</a> ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>) ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a>) ([Intel XE#2136]) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>) ([Intel XE#316]) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a>) ([Intel XE#2327]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([Intel XE#2327])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a>) ([Intel XE#1124]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> ([Intel XE#1124]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a>) ([Intel XE#1124] / [Intel XE#2136]) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([Intel XE#1124])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>) ([Intel XE#610]) +1 other test ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([Intel XE#610])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([Intel XE#1124]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([Intel XE#2136]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([Intel XE#1124]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>) ([Intel XE#1124]) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([Intel XE#1124]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a>) ([Intel XE#1124]) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([Intel XE#619]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a>) ([Intel XE#1124] / [Intel XE#2136]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a>) ([Intel XE#367]) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> ([Intel XE#2191])</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>) ([Intel XE#2191]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> ([Intel XE#2314] / [Intel XE#2894]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>) ([Intel XE#2314] / [Intel XE#2423] / [Intel XE#2894]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> ([Intel XE#2314] / [Intel XE#2894])</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> ([Intel XE#367]) +5 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> ([Intel XE#367])</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> ([Intel XE#367]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#367]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a>) ([Intel XE#367]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> ([Intel XE#367]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#367])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([Intel XE#2887]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2887]) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([Intel XE#2907]) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2652] / [Intel XE#787])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a>) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a>) ([Intel XE#455] / [Intel XE#787]) +24 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> ([Intel XE#455] / [Intel XE#787]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html">SKIP</a> ([Intel XE#2887]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> ([Intel XE#2652] / [Intel XE#787]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2652] / [Intel XE#787])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a>) ([Intel XE#3442]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> ([Intel XE#3432]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> ([Intel XE#2136])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> ([Intel XE#455] / [Intel XE#787]) +19 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> ([Intel XE#3432])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([Intel XE#3432]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#3432])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2887]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> ([Intel XE#2887]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> ([Intel XE#2136]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>) ([Intel XE#2907]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>) ([Intel XE#2887]) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a>) ([Intel XE#2652] / [Intel XE#787])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a>) ([Intel XE#2325] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> ([Intel XE#2325])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([Intel XE#2325]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>) ([Intel XE#2325] / [Intel XE#2423]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a>) ([Intel XE#306]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a>) ([Intel XE#2325]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([Intel XE#306]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> ([Intel XE#2325]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_color@gamma.html">SKIP</a> ([Intel XE#2423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a>) ([Intel XE#2252]) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> ([Intel XE#2252]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> ([Intel XE#2423]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a>) ([Intel XE#2252] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([Intel XE#2252]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a>) ([Intel XE#2252] / [Intel XE#2423]) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a>) ([Intel XE#373]) +26 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([Intel XE#373]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_concurrent@multi-plane-atomic-lowres.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_concurrent@multi-plane-atomic-lowres.html">DMESG-WARN</a> ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">FAIL</a>) ([Intel XE#1178])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_content_protection@content-type-change.html">SKIP</a> ([Intel XE#2341]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([Intel XE#307])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>) ([Intel XE#2390])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>) ([Intel XE#307]) +3 other tests ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>) ([Intel XE#2390] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([Intel XE#2390]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_content_protection@legacy.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_content_protection@legacy.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_content_protection@legacy.html">FAIL</a>) ([Intel XE#1178]) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_content_protection@mei-interface.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SKIP</a> ([Intel XE#2341])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_content_protection@srm.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_content_protection@srm.html">FAIL</a> ([Intel XE#1178]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> ([Intel XE#1178]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html">INCOMPLETE</a> ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_content_protection@uevent.html">SKIP</a>) ([Intel XE#2341] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> ([Intel XE#2320]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a>) ([Intel XE#2320] / [Intel XE#2423]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([Intel XE#2320])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>) ([Intel XE#2321] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([Intel XE#2320]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([Intel XE#2423]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a>) ([Intel XE#308]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([Intel XE#308]) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([Intel XE#2321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>) ([Intel XE#2321] / [Intel XE#2423]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x256.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a>) ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a>) ([Intel XE#2320])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a>) ([Intel XE#2320] / [Intel XE#2423]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([Intel XE#2321])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([Intel XE#2321]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([Intel XE#2423]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>) ([Intel XE#323]) +1 other test ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>) ([Intel XE#2286] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([Intel XE#2286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">PASS</a>) ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#3226]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a>) ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a>) ([Intel XE#877])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> ([Intel XE#877]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([Intel XE#2291]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([Intel XE#2423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([Intel XE#323])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([Intel XE#2286]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>) ([Intel XE#2286] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([Intel XE#1508]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>) ([Intel XE#1508] / [Intel XE#2136])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([Intel XE#455]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([Intel XE#2323]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_draw_crc@fill-fb.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_draw_crc@fill-fb.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_draw_crc@fill-fb.html">INCOMPLETE</a>) ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> ([Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a>) ([Intel XE#455])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([Intel XE#2244])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a>) ([Intel XE#2244]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2244])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>) ([Intel XE#455]) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a>) ([Intel XE#1695] / [Intel XE#2136]) +1 other test ( 1 fail, 1 skip )</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a>) ([Intel XE#776]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>) ([Intel XE#776])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">SKIP</a>) ([Intel XE#701])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a>) ([Intel XE#1138])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([Intel XE#1137])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([Intel XE#2375]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a>) ([Intel XE#2375] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a>) ([Intel XE#1135]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a>) ([Intel XE#2316])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([Intel XE#2316]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a>) ([Intel XE#2316] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> ([Intel XE#2882]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a>) ([Intel XE#3468])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> ([Intel XE#301]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> ([Intel XE#3486]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">DMESG-WARN</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> ([Intel XE#3321] / [Intel XE#3486]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>) ([Intel XE#3321] / [Intel XE#3486])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-FAIL</a>) ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> ([Intel XE#886]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a>) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>) ([Intel XE#301])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([Intel XE#2597]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> ([Intel XE#2293] / [Intel XE#2380]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> ([Intel XE#2136]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) ([Intel XE#2293] / [Intel XE#2380])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([Intel XE#2293] / [Intel XE#2380])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> ([Intel XE#2293] / [Intel XE#2380]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2293] / [Intel XE#2380]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2380])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) ([Intel XE#455]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([Intel XE#455]) +4 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2293] / [Intel XE#2380])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a>) ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> ([Intel XE#651]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2312]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) ([Intel XE#651]) +61 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> ([Intel XE#2311]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> ([Intel XE#2136]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> ([Intel XE#2312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) ([Intel XE#2311])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([Intel XE#2311]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) ([Intel XE#2311] / [Intel XE#2312]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([Intel XE#2311]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([Intel XE#651]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> ([Intel XE#2312]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> ([Intel XE#2311]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a>) ([Intel XE#651]) +27 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a>) ([Intel XE#2136] / [Intel XE#2333]) +5 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">FAIL</a> ([Intel XE#2333])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">FAIL</a> ([Intel XE#2333]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">FAIL</a>) ([Intel XE#2333] / [Intel XE#3468]) +2 other tests ( 1 dmesg-fail, 1 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> ([Intel XE#2333]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">FAIL</a>) ([Intel XE#2333] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">DMESG-FAIL</a> ([Intel XE#3468]) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> ([Intel XE#2333]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2333]) +5 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">FAIL</a> ([Intel XE#2333]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2312])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">FAIL</a> ([Intel XE#2333]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) ([Intel XE#2312] / [Intel XE#2333])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">FAIL</a>) ([Intel XE#2312] / [Intel XE#2333]) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">FAIL</a>) ([Intel XE#2333]) +3 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">FAIL</a> ([Intel XE#2333]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">DMESG-FAIL</a> ([Intel XE#3468]) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">INCOMPLETE</a>) ([Intel XE#1727]) +2 other tests ( 2 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([Intel XE#2312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a>) ([Intel XE#2312] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([Intel XE#2312]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> ([Intel XE#2333])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> ([Intel XE#2333]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> ([Intel XE#2136]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">SKIP</a> ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> ([Intel XE#2333]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-FAIL</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">DMESG-FAIL</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a>) ([Intel XE#2136] / [Intel XE#2333])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([Intel XE#658])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([Intel XE#2352]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2311]) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> ([Intel XE#2312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2311])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([Intel XE#2311]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2312]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) ([Intel XE#2311]) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([Intel XE#2312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) ([Intel XE#2311] / [Intel XE#2312])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([Intel XE#2311]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2311]) +24 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> ([Intel XE#2313]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([Intel XE#653]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([Intel XE#2313]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([Intel XE#2312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2312]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2313]) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> ([Intel XE#2313]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> ([Intel XE#2136]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>) ([Intel XE#658])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> ([Intel XE#2350]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2350])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> ([Intel XE#2313]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2313]) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a>) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) ([Intel XE#2313]) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([Intel XE#2313]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2312])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) ([Intel XE#653]) +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([Intel XE#653]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([Intel XE#2312]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([Intel XE#2313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([Intel XE#2312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) ([Intel XE#2313]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([Intel XE#2312]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([Intel XE#2136]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a>) ([Intel XE#653]) +61 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([Intel XE#2502]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2502])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) ([Intel XE#605])</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_getfb@getfb2-accept-ccs.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_getfb@getfb2-accept-ccs.html">DMESG-WARN</a>) ([Intel XE#1727]) +2 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([Intel XE#455]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([Intel XE#346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([Intel XE#2934]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2934])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>) ([Intel XE#346]) +1 other test ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([Intel XE#346]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#346])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([Intel XE#3012]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a>) ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([Intel XE#2934]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([Intel XE#2136])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([Intel XE#2925])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([Intel XE#2927])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a>) ([Intel XE#356])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([Intel XE#2486])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a>) ([Intel XE#2566])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> ([Intel XE#1035] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane@plane-position-hole-dpms.html">INCOMPLETE</a> ([Intel XE#1035] / [Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-basic.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-basic.html">DMESG-FAIL</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_plane_cursor@viewport.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_cursor@viewport.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_cursor@viewport.html">FAIL</a>) ([Intel XE#616])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([Intel XE#2393]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([Intel XE#2493]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2493]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a>) ([Intel XE#361])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">DMESG-WARN</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([Intel XE#2763]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([Intel XE#2423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2763]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([Intel XE#2763]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2763]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a>) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([Intel XE#2763])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) ([Intel XE#870])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([Intel XE#870]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a>) ([Intel XE#2938])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) ([Intel XE#870])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([Intel XE#1129])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([Intel XE#2392]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2392])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) ([Intel XE#3309])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) ([Intel XE#3309])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>) ([Intel XE#908])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>) ([Intel XE#1430] / [Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> ([Intel XE#1430]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a>) ([Intel XE#1430])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a>) ([Intel XE#1129])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) ([Intel XE#908])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a> ([Intel XE#3527])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([Intel XE#2499]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2499])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_pm_rpm@cursor.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_rpm@cursor.html">INCOMPLETE</a>) ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>) ([Intel XE#1439] / [Intel XE#2446] / [Intel XE#3141])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([Intel XE#1439]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>) ([Intel XE#1439] / [Intel XE#2446])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">DMESG-WARN</a>) ([Intel XE#1727] / [Intel XE#3468])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) ([Intel XE#2446])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html">ABORT</a> ([Intel XE#3468])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) ([Intel XE#1439] / [Intel XE#3141])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([Intel XE#2446]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a>) ([Intel XE#3289])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([Intel XE#2446]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">DMESG-WARN</a> ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> ([Intel XE#2864]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a>) ([Intel XE#2446])</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-set-prop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_prop_blob@invalid-set-prop.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_prop_blob@invalid-set-prop.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_prop_blob@invalid-set-prop.html">SKIP</a>) ([Intel XE#2423]) +36 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> ([Intel XE#1489]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a>) ([Intel XE#1489]) +23 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a>) ([Intel XE#1489] / [Intel XE#2136]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> ([Intel XE#1489]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a>) ([Intel XE#1489]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> ([Intel XE#1489]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> ([Intel XE#2136]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> ([Intel XE#1489]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>) ([Intel XE#1489] / [Intel XE#2136]) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>) ([Intel XE#1122]) +1 other test ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([Intel XE#2387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([Intel XE#2136])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([Intel XE#1122])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a>) ([Intel XE#2850] / [Intel XE#929]) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a>) ([Intel XE#2850] / [Intel XE#929]) +29 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@pr-no-drrs.html">SKIP</a> ([Intel XE#2136]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@kms_psr@psr-basic.html">SKIP</a> ([Intel XE#2234] / [Intel XE#2850]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@psr-basic.html">SKIP</a> ([Intel XE#2136]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> ([Intel XE#2351]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> ([Intel XE#2850] / [Intel XE#929])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@psr-suspend.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_psr@psr-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_psr@psr-suspend.html">SKIP</a>) ([Intel XE#2234] / [Intel XE#2850]) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html">SKIP</a> ([Intel XE#2234] / [Intel XE#2850]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html">SKIP</a>) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850]) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_psr@psr2-primary-render.html">SKIP</a>) ([Intel XE#2234])</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([Intel XE#2136] / [Intel XE#2351]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a>) ([Intel XE#2939])</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([Intel XE#2136]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a>) ([Intel XE#2939])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a>) ([Intel XE#3414]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">INCOMPLETE</a> ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([Intel XE#1127])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([Intel XE#2330]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a>) ([Intel XE#2330] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> ([Intel XE#3414]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#3414]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([Intel XE#2423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([Intel XE#2330])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>) ([Intel XE#1127]) +2 other tests ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([Intel XE#2330]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([Intel XE#3414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([Intel XE#3414]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a>) ([Intel XE#2413] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a>) ([Intel XE#1435])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([Intel XE#1500])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#2450])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a>) ([Intel XE#2168])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_vrr@flip-basic.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@kms_vrr@flip-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@kms_vrr@flip-basic.html">SKIP</a>) ([Intel XE#1499])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a>) ([Intel XE#455]) +24 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> ([Intel XE#1499]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> ([Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([Intel XE#1499]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>) ([Intel XE#1499] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a>) ([Intel XE#1499] / [Intel XE#2423])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([Intel XE#756]) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([Intel XE#2423]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a>) ([Intel XE#756])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) ([Intel XE#756]) +2 other tests ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([Intel XE#756]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) ([Intel XE#2423] / [Intel XE#756])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> ([Intel XE#2423] / [i915#2575]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a>) ([Intel XE#1091] / [Intel XE#2849]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_ccs@suspend-resume.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> ([Intel XE#1727] / [Intel XE#2771] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> ([Intel XE#1280] / [Intel XE#455])</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a>) ([Intel XE#1123]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> ([Intel XE#1123])</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a>) ([Intel XE#1126]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> ([Intel XE#1126])</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a>) ([Intel XE#2905]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_eudebug@basic-read-event.html">SKIP</a> ([Intel XE#2905]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@basic-read-event.html">SKIP</a> ([Intel XE#1130]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> ([Intel XE#2905]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2905]) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_eudebug@connect-user.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_eudebug@connect-user.html">SKIP</a> ([Intel XE#2905]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2905]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a>) ([Intel XE#2905]) +37 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> ([Intel XE#2905]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a>) ([Intel XE#1727])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> ([Intel XE#2364]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a>) ([Intel XE#1473] / [Intel XE#1727])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> ([Intel XE#1473]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> ([Intel XE#1473] / [Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a>) ([Intel XE#1473] / [Intel XE#402])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> ([Intel XE#1473]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">FAIL</a>) ([Intel XE#1000] / [Intel XE#1130])</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> ([Intel XE#1473]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> ([Intel XE#1130])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a>) ([Intel XE#1473])</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a>) ([Intel XE#1473])</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_exec_basic@many-execqueues-basic.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exec_basic@many-execqueues-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-execqueues-basic.html">SKIP</a>) ([Intel XE#1130])</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> ([Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">SKIP</a> ([Intel XE#1130]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">DMESG-WARN</a> ([Intel XE#1727]) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">PASS</a>) ([Intel XE#1130]) +52 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2322]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> ([Intel XE#2322]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2322]) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> ([Intel XE#2322]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> ([Intel XE#2322]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> ([Intel XE#1130]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a>) ([Intel XE#2322]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">DMESG-WARN</a> ([Intel XE#1727]) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>) ([Intel XE#288]) +71 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> ([Intel XE#288]) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>) ([Intel XE#2360]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_exercise_blt@fast-copy-inc-dimension.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_exercise_blt@fast-copy-inc-dimension.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_exercise_blt@fast-copy-inc-dimension.html">DMESG-WARN</a>) ([Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a>) ([Intel XE#3343]) +3 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> ([Intel XE#3343])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> ([Intel XE#3343]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a>) ([Intel XE#3343])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> ([Intel XE#3343])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a>) ([Intel XE#1130] / [Intel XE#3499])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> ([Intel XE#3499]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a>) ([Intel XE#1130] / [Intel XE#3499])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> ([Intel XE#3467] / [Intel XE#3468]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">FAIL</a>) ([Intel XE#1130] / [Intel XE#3499])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a>) ([Intel XE#3467]) +6 other tests ( 2 dmesg-warn )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a>) ([Intel XE#3499])</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> ([Intel XE#3467]) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a>) ([Intel XE#255])</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> ([Intel XE#2229]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a>) ([Intel XE#2229])</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html">FAIL</a> ([Intel XE#1999]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html">SKIP</a>) ([Intel XE#1192])</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a>) ([Intel XE#560])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_media_fill@media-fill.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_media_fill@media-fill.html">SKIP</a>) ([Intel XE#2459] / [Intel XE#2596])</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a>) ([Intel XE#586])</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_module_load@reload-no-display.html">FAIL</a> ([Intel XE#3625]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_module_load@reload-no-display.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_module_load@reload-no-display.html">FAIL</a>) ([Intel XE#3625])</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> ([Intel XE#3546]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a>) ([Intel XE#3467])</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-7/igt@xe_module_load@unload.html">DMESG-WARN</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_module_load@unload.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_module_load@unload.html">DMESG-WARN</a>) ([Intel XE#3467])</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> ([Intel XE#3573]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_oa@oa-exponents.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_oa@oa-exponents.html">DMESG-WARN</a> ([Intel XE#3468]) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html">SKIP</a>) ([Intel XE#3573]) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_oa@syncs-userptr-wait-cfg.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-4/igt@xe_oa@syncs-userptr-wait-cfg.html">PASS</a>) ([Intel XE#3468]) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> ([Intel XE#2248]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> ([Intel XE#1130]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html">SKIP</a>) ([Intel XE#979])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">ABORT</a>) ([Intel XE#1358] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> ([Intel XE#2284]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-7/igt@xe_pm@d3cold-mmap-system.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#2284])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a>) ([Intel XE#2284])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> ([Intel XE#2284]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> ([Intel XE#1130]) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a>) ([Intel XE#2284] / [Intel XE#366]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html">DMESG-FAIL</a> ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a>) ([Intel XE#1727] / [Intel XE#3468]) +4 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html">SKIP</a> ([Intel XE#1130])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> ([Intel XE#2284])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_pm@s4-multiple-execs.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) ([Intel XE#579])</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> ([Intel XE#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> ([Intel XE#1130])</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a>) ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> ([Intel XE#958]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a>) ([Intel XE#958])</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> ([Intel XE#944]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a>) ([Intel XE#944]) +6 other tests ( 2 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_query@multigpu-query-engines.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-2/igt@xe_query@multigpu-query-engines.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_query@multigpu-query-engines.html">SKIP</a>) ([Intel XE#944])</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> ([Intel XE#944]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#944]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> ([Intel XE#944])</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a>) ([Intel XE#1130] / [Intel XE#944])</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> ([Intel XE#1130]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> ([Intel XE#3342])</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) ([Intel XE#3342])</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_tlb@basic-tlb.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_tlb@basic-tlb.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-436/igt@xe_tlb@basic-tlb.html">FAIL</a>) ([Intel XE#2922])</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-16777216:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-434/igt@xe_vm@large-misaligned-binds-16777216.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_vm@large-misaligned-binds-16777216.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-435/igt@xe_vm@large-misaligned-binds-16777216.html">DMESG-WARN</a>) ([Intel XE#1727]) +2 other tests ( 2 dmesg-warn )</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-dg2-436/igt@xe_vm@large-userptr-misaligned-binds-536870912.html">SKIP</a> ([Intel XE#1130]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-466/igt@xe_vm@large-userptr-misaligned-binds-536870912.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-dg2-434/igt@xe_vm@large-userptr-misaligned-binds-536870912.html">PASS</a>) ([Intel XE#1727])</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-2097152:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8129/shard-bmg-2/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html">DMESG-WARN</a> ([Intel XE#1727]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-1/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12216/shard-bmg-3/igt@xe_vm@large-userptr-split-misaligned-binds-2">PASS</a>) ([Intel XE#1130])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2917479188130650566==--
