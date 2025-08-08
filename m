Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF0C87FCB
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 05:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97A210E4BB;
	Fri,  8 Aug 2025 05:35:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9496210E4B8;
 Fri,  8 Aug 2025 05:35:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9077082856880786119=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fexec=5Fsy?=
 =?utf-8?q?stem=5Fallocator=3A_Add_prefetch-sys-benchmark?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 08 Aug 2025 05:35:36 -0000
Message-ID: <175463133659.221654.16261484270318809618@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808032402.1652099-1-matthew.brost@intel.com>
In-Reply-To: <20250808032402.1652099-1-matthew.brost@intel.com>
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

--===============9077082856880786119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Add prefetch-sys-benchmark
URL   : https://patchwork.freedesktop.org/series/152663/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8488_FULL -> XEIGTPW_13560_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13560_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13560_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13560_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  
#### Warnings ####

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][7] ([Intel XE#4518]) -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  
New tests
---------

  New tests have been introduced between XEIGT_8488_FULL and XEIGTPW_13560_FULL:

### New IGT tests (1) ###

  * igt@xe_exec_system_allocator@prefetch-sys-benchmark:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13560_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@fbdev@read.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#911]) +7 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#4208] / [i915#2575]) +116 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#610])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#610])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1428])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +90 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2341])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2291])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#1475])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4208] / [i915#2575]) +10 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4356]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#701])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#703])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2316])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#5338]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#301]) +2 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2293] / [Intel XE#2380])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401] / [Intel XE#1745])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#656]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#5390]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#651]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2311]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#651]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#658])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1469])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2352])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#653]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2312]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#356])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#616]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-436/igt@kms_plane_cursor@viewport.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#4596])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2685] / [Intel XE#3307])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#455])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#908])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#718])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2499])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4608])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1489]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1489]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#3414] / [Intel XE#3904])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#4459]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#5626])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#4837]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#4837]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_eudebug@discovery-race-sigint.html
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#4837]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#688])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#4208]) +256 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@xe_exec_basic@many-null-rebind.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1392])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1392]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2322]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][101] -> [INCOMPLETE][102] ([Intel XE#4842])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#1392]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4208]) +53 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free.html

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4943]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4943]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4915]) +72 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][110] ([Intel XE#4917])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][111] -> [FAIL][112] ([Intel XE#4208]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@xe_module_load@reload.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#3573]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1337])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2284] / [Intel XE#366])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#5742])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-464/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2284]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4733])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-434/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#944])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#944]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#3342])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4273])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#4351])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][125] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][127] ([Intel XE#2291]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][129] ([Intel XE#4302]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][131] ([Intel XE#2316]) -> [PASS][132] +2 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][133] ([Intel XE#301]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][135] ([Intel XE#1503]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][137] ([Intel XE#1435]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][139] ([Intel XE#1091] / [Intel XE#2849]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1392]) -> [PASS][142] +3 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][143] ([Intel XE#5786]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@partial-remap-cpu-fault:
    - shard-bmg:          [FAIL][145] ([Intel XE#5625]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@xe_exec_system_allocator@partial-remap-cpu-fault.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_exec_system_allocator@partial-remap-cpu-fault.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][147], [SKIP][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172]) ([Intel XE#378]) -> ([PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-3/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-2/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-8/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-2/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-1/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [SKIP][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223]) ([Intel XE#2457]) -> ([PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-4/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-8/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-5/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-5/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-1/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-1/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-1/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][249] ([Intel XE#4650]) -> [PASS][250] +2 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-8/igt@xe_pmu@fn-engine-activity-load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][251] ([Intel XE#4819]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_pmu@gt-frequency.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][253] ([Intel XE#4130]) -> [PASS][254] +5 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][255] ([Intel XE#3342]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][257] ([Intel XE#4273]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          [SKIP][259] ([Intel XE#4351]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#3768]) -> [SKIP][262] ([Intel XE#4208] / [i915#2575])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#316]) -> [SKIP][264] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#316]) -> [SKIP][266] ([Intel XE#4208]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1124]) -> [SKIP][268] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#607]) -> [SKIP][270] ([Intel XE#2351] / [Intel XE#4208])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#607]) -> [SKIP][272] ([Intel XE#4208])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1124]) -> [SKIP][274] ([Intel XE#4208]) +9 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2191]) -> [SKIP][276] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#367]) -> [SKIP][278] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2907]) -> [SKIP][280] ([Intel XE#4208]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][282] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#3442]) -> [SKIP][284] ([Intel XE#4208]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][285] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [SKIP][286] ([Intel XE#2351] / [Intel XE#4208])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][288] ([Intel XE#4208]) +8 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#306]) -> [SKIP][290] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#373]) -> [SKIP][292] ([Intel XE#4208] / [i915#2575]) +12 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][293] ([Intel XE#2341]) -> [FAIL][294] ([Intel XE#1178]) +2 other tests fail
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_content_protection@atomic.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#307]) -> [SKIP][296] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][297] ([Intel XE#1178]) -> [SKIP][298] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#308]) -> [SKIP][300] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4354]) -> [SKIP][302] ([Intel XE#4208])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4331]) -> [SKIP][304] ([Intel XE#4208])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#455]) -> [SKIP][306] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-464/igt@kms_dsc@dsc-basic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#4422]) -> [SKIP][308] ([Intel XE#4208])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#776]) -> [SKIP][310] ([Intel XE#4208])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1138]) -> [SKIP][312] ([Intel XE#4208] / [i915#2575])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1137]) -> [SKIP][314] ([Intel XE#4208] / [i915#2575])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#455]) -> [SKIP][316] ([Intel XE#4208]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][317] ([Intel XE#2312]) -> [SKIP][318] ([Intel XE#2311]) +10 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][319] ([Intel XE#2311]) -> [SKIP][320] ([Intel XE#2312]) +9 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#651]) -> [SKIP][322] ([Intel XE#2351] / [Intel XE#4208]) +15 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][323] ([Intel XE#5390]) -> [SKIP][324] ([Intel XE#2312]) +7 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][325] ([Intel XE#2312]) -> [SKIP][326] ([Intel XE#5390]) +7 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#658]) -> [SKIP][328] ([Intel XE#2351] / [Intel XE#4208])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#651]) -> [SKIP][330] ([Intel XE#4208]) +26 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#653]) -> [SKIP][332] ([Intel XE#4208]) +29 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#653]) -> [SKIP][334] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][335] ([Intel XE#2312]) -> [SKIP][336] ([Intel XE#2313]) +11 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][337] ([Intel XE#2313]) -> [SKIP][338] ([Intel XE#2312]) +8 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][339] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][340] ([Intel XE#3544])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2927]) -> [SKIP][342] ([Intel XE#4208])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2925]) -> [SKIP][344] ([Intel XE#4208])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#5021]) -> [SKIP][346] ([Intel XE#4208] / [i915#2575])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#5020]) -> [SKIP][348] ([Intel XE#4208] / [i915#2575])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#870]) -> [SKIP][350] ([Intel XE#4208]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1129]) -> [SKIP][352] ([Intel XE#4208])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1489]) -> [SKIP][354] ([Intel XE#4208]) +12 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1122]) -> [SKIP][356] ([Intel XE#4208])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][358] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][360] ([Intel XE#4208]) +14 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2939]) -> [SKIP][362] ([Intel XE#2351] / [Intel XE#4208])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#3414]) -> [SKIP][364] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][365] ([Intel XE#1729]) -> [SKIP][366] ([Intel XE#4208] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#455]) -> [SKIP][368] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@kms_vrr@flipline.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][370] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][372] ([Intel XE#4208])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#5249]) -> [SKIP][374] ([Intel XE#4208])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@xe_configfs@survivability-mode.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#1123]) -> [SKIP][376] ([Intel XE#4208])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1126]) -> [SKIP][378] ([Intel XE#4208])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#5626]) -> [SKIP][380] ([Intel XE#4208])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#4837]) -> [SKIP][382] ([Intel XE#4208]) +20 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1392]) -> [SKIP][384] ([Intel XE#4208])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#288]) -> [SKIP][386] ([Intel XE#4208]) +32 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#4915]) -> [SKIP][388] ([Intel XE#4208]) +345 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#255]) -> [SKIP][390] ([Intel XE#4208])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#5103]) -> [SKIP][392] ([Intel XE#4208])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#3573]) -> [SKIP][394] ([Intel XE#4208]) +7 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#977]) -> [SKIP][396] ([Intel XE#4208])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][397] ([Intel XE#1173]) -> [SKIP][398] ([Intel XE#1061] / [Intel XE#4208])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@xe_peer2peer@write.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2284]) -> [SKIP][400] ([Intel XE#4208])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-463/igt@xe_pm@d3cold-mocs.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          [SKIP][401] ([Intel XE#5695]) -> [SKIP][402] ([Intel XE#5742])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@xe_pm@d3hot-i2c.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-2/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          [SKIP][403] ([Intel XE#5695]) -> [SKIP][404] ([Intel XE#5742])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_pm@d3hot-i2c.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#4650]) -> [SKIP][406] ([Intel XE#4208])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#4733]) -> [SKIP][408] ([Intel XE#4208]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#944]) -> [SKIP][410] ([Intel XE#4208]) +4 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#4814]) -> [SKIP][412] ([Intel XE#4208]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-435/igt@xe_render_copy@render-stress-4-copies.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#4130]) -> [SKIP][414] ([Intel XE#4208]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5762
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8488 -> IGTPW_13560
  * Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -> xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef

  IGTPW_13560: 1d78e4e1d3c4b73c7211ffdbb9f952ad5087feff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8
  xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef: c59a466c9c1d514e151d30f0a66ce76ce8d21aef

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/index.html

--===============9077082856880786119==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Add pr=
efetch-sys-benchmark</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152663/">https://patchwork.freedesktop.org/series/152663/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13560/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13560/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8488_FULL -&gt; XEIGTPW_13560_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13560_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13560_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
560_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/sh=
ard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-userptr-in=
validate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13560/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared=
-vm-userptr-invalidate-race.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_=
send_recv.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13560/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe=
_guc_mmio_send_recv.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_eudebug_sriov@deny-sriov:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4=
518</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3560/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> +1 other te=
st skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8488_FULL and XEIGTPW_13560=
_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_exec_system_allocator@prefetch-sys-benchmark:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13560_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@fbdev@read.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@kms_async_flips@asyn=
c-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#9=
11</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonbl=
ocking-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_atomic_transition@modeset-t=
ransition-nonblocking-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1=
16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13560/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled=
-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13560/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio=
-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_content_protection@srm@pip=
e-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13560/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tran=
sitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_cursor_legacy@nonblocking-=
modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@kms_dp_link_training@uhbr-sst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4356">Intel XE#4356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13560/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/s=
hard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1356=
0/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@kms_multipipe_modeset@basic-ma=
x-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-436/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2=
-466/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/sha=
rd-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/=
shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#268=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307=
">Intel XE#3307</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1356=
0/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">In=
tel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@k=
ms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@xe_eu_stall@blocking-re-enable=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-exten=
ded-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-pa=
rallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@xe_exec_basic@many-null-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shar=
d-dg2-436/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
256 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13560/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-rebind.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13560/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_exec_fault_mode@many-bindex=
ecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_system_allocator@proce=
ss-many-large-execqueues-mmap-free.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +53 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_exec_system_allocator@process=
-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_exec_system_allocator@threads=
-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-file-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_exec_system_allocator@twice=
-large-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +72 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@xe_fault_injection@probe-fail-=
guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@xe_module_load@reload.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436=
/igt@xe_module_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@xe_oa@polling-small-buf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-466/igt@xe_pat@display-vs-wb-transient=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-435/igt@xe_pm@d3cold-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_pm@d3cold-basic-exec.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-464/igt@xe_pm@d3hot-i2c.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Inte=
l XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-434/igt@xe_pxp@regular-src-to-pxp-dest=
-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_query@multigpu-query-invalid-=
query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_query@multigpu-query-topolo=
gy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Int=
el XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13560/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13560/shard-bmg-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-leg=
acy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13560/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1356=
0/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13560/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE=
#1503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13560/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13560/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">I=
ntel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2849">Intel XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprob=
e-off.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-463/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +3 other t=
ests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-pref=
etch.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5786">Intel XE#5786</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_exec_system_allocator@many=
-stride-malloc-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-cpu-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-7/igt@xe_exec_system_allocator@partial-remap-cpu-fault=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5625">Intel XE#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_exec_system_allocator@partial-=
remap-cpu-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8488/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_modul=
e_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8488/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8488/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8488/shard-lnl-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-ln=
l-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8488/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard=
-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
488/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8488/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8488/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8488/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13560/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13560/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard=
-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
560/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13560/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13560/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13560/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13560/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13560/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13560/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-ln=
l-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13560/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8488/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8488/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8488/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8488/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bm=
g-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8488/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-6/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
488/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8488/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8488/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8488/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8488/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_135=
60/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13560/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13560/shard-bmg-1/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13560/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13560/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13560/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13560/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13560/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13560/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard=
-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-8/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel X=
E#4650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13560/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/s=
hard-dg2-463/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on=
-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-3/igt@xe_sriov_auto_provi=
sioning@resources-released-on-vfs-disabling.html">PASS</a> +5 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#33=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
560/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE=
#4273</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13560/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4351">Intel XE#4351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13560/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine=
-resets.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3768">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Int=
el XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13560/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Int=
el XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13560/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">=
Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_big_fb@yf-ti=
led-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_bw@connected-linear-t=
iling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13560/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
07">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3442">Intel XE#3442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13560/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_ccs@random-ccs-data-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">I=
ntel XE#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13560/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13560/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
07">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13560/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13560/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308=
">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13560/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13560/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@kms_dp_linktrain_fallback@dsc-fallback.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/433=
1">Intel XE#4331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13560/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-464/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard=
-dg2-436/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb=
-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4422">Intel XE#4422</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-di=
rty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#77=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_135=
60/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Int=
el XE#1138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13560/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel X=
E#1137</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13560/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_flip_scale=
d_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-8/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"=
>Intel XE#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuff=
er_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-in=
dfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tra=
cking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +29 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
53">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13560/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdra=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-4/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13560/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
27">Intel XE#2927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13560/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Inte=
l XE#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13560/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE=
#5020</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13560/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel=
 XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13560/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/sha=
rd-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel=
 XE#1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13560/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel X=
E#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">=
Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13560/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2939">Intel XE#2939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@kms_psr_stress_test@flip-p=
rimary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE=
#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13560/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13560/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-=
dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@sriov_basic@e=
nable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">I=
ntel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_compute_preempt@compute-pree=
mpt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@xe_configfs@survivability-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249">Intel=
 XE#5249</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13560/shard-dg2-436/igt@xe_configfs@survivability-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">I=
ntel XE#1123</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13560/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">=
Intel XE#1126</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13560/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5=
626</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3560/shard-dg2-436/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1356=
0/shard-dg2-436/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +20=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_basic@multigpu-no-=
exec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-reb=
ind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eo=
check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-man=
y-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_e=
xec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) +345 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/=
shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103">In=
tel XE#5103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13560/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_oa@whitelisted-registers-users=
pace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/=
shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@xe_peer2peer@write.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/sh=
ard-dg2-436/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/sha=
rd-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-lnl-4/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-l=
nl-2/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-bmg-1/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-b=
mg-2/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel=
 XE#4650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13560/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Int=
el XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13560/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-435/igt@xe_render_copy@render-stress-4-copies.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814=
">Intel XE#4814</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13560/shard-dg2-436/igt@xe_render_copy@render-stress-4-copies.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8488/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-=
on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13560/shard-dg2-436/igt@xe_sriov_auto_p=
rovisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8488 -&gt; IGTPW_13560</li>
<li>Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -&gt; xe-3516-c=
59a466c9c1d514e151d30f0a66ce76ce8d21aef</li>
</ul>
<p>IGTPW_13560: 1d78e4e1d3c4b73c7211ffdbb9f952ad5087feff @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091a=
a5f5c7af0abf6fdf8<br />
  xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef: c59a466c9c1d514e151d30f=
0a66ce76ce8d21aef</p>

</body>
</html>

--===============9077082856880786119==--
