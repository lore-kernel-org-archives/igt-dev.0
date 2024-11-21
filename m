Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6632ED743FC
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 01:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97C10E82A;
	Thu, 21 Nov 2024 01:54:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD0E10E827;
 Thu, 21 Nov 2024 01:54:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fcdclk=2E?=
 =?utf-8?q?c=3A_Handle_scenario_where_ref_and_new_cdclk_is_same?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 01:54:04 -0000
Message-ID: <173215404440.935800.15433406396463743763@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120140134.1746751-1-swati2.sharma@intel.com>
In-Reply-To: <20241120140134.1746751-1-swati2.sharma@intel.com>
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

Series: tests/intel/kms_cdclk.c: Handle scenario where ref and new cdclk is same
URL   : https://patchwork.freedesktop.org/series/141611/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12148_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12148_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12148_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12148_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-b-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-2/igt@kms_vblank@query-forked.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +4 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_ccs@suspend-resume.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_create@create-invalid-size:
    - shard-lnl:          [PASS][7] -> [DMESG-WARN][8] +12 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_create@create-invalid-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@xe_create@create-invalid-size.html

  * igt@xe_drm_fdinfo@utilization-all-full-load:
    - shard-lnl:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_drm_fdinfo@utilization-all-full-load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@xe_drm_fdinfo@utilization-all-full-load.html

  * igt@xe_exec_atomic@basic-dec-all:
    - shard-bmg:          [PASS][11] -> [DMESG-WARN][12] +4 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_exec_atomic@basic-dec-all.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_exec_atomic@basic-dec-all.html

  * igt@xe_prime_self_import@reimport-vs-gem_close-race:
    - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@xe_prime_self_import@reimport-vs-gem_close-race.html

  * igt@xe_vm@mixed-userptr-misaligned-binds-3145728:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][15] +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-8/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html

  
#### Warnings ####

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][16] ([Intel XE#2423] / [i915#2575]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_plane_lowres@tiling-none.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@xe_exec_threads@threads-cm-shared-vm-rebind:
    - shard-bmg:          [DMESG-WARN][22] ([Intel XE#3468]) -> [DMESG-WARN][23] +1 other test dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
    - shard-dg2-set2:     [SKIP][24] ([Intel XE#1130]) -> [DMESG-WARN][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][26] ([Intel XE#2136]) -> [FAIL][27] +2 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_module_load@reload.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_module_load@reload.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12148_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][28] ([Intel XE#3468] / [Intel XE#3521])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1885])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][30] -> [FAIL][31] ([Intel XE#3130] / [Intel XE#3249])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#2134]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@fbdev@write.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][34] ([Intel XE#3468]) +19 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2613])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#1701]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1407])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-lnl:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#3225] / [Intel XE#3466])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2327]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#316])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-bmg:          [PASS][44] -> [DMESG-FAIL][45] ([Intel XE#3468] / [Intel XE#877])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1124]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1124]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1124]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [PASS][51] -> [DMESG-WARN][52] ([Intel XE#2705])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2191]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2314] / [Intel XE#2894])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2314] / [Intel XE#2894])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#367])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#367]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#787]) +104 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2887]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2887]) +12 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3433]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#373]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2325])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#306])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2252]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#373])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][70] ([Intel XE#1178])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#307])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#1178]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#1188])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#308]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2320]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2321])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1424])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2321])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#3226])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2291])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#309]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2291])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1508])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1340]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#3070])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2244]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2244])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1138])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1137])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2423] / [i915#2575]) +104 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][94] -> [FAIL][95] ([Intel XE#3321] / [Intel XE#3487]) +2 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1421]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][97] ([Intel XE#3468]) +6 other tests dmesg-fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#2316]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2316])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][101] -> [FAIL][102] ([Intel XE#2882]) +3 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][103] -> [INCOMPLETE][104] ([Intel XE#2635] / [Intel XE#3468])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][105] -> [DMESG-FAIL][106] ([Intel XE#3468]) +31 other tests dmesg-fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#301]) +4 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#3486])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][109] ([Intel XE#301] / [Intel XE#3486])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][110] ([Intel XE#2049])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#455]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1397] / [Intel XE#1745])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1397])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2380]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2136]) +31 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1401]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2293]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#651]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2311]) +16 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][122] ([Intel XE#2333]) +4 other tests fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#2136]) +36 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][125] ([Intel XE#3468]) +5 other tests dmesg-fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-lnl:          [PASS][126] -> [DMESG-WARN][127] ([Intel XE#3514]) +8 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2312]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#656]) +19 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#651]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2313]) +14 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#653]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1503])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2423] / [i915#2575]) +33 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][136] ([Intel XE#2566] / [Intel XE#877])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][137] ([Intel XE#877]) +1 other test dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][138] ([Intel XE#361])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#2763]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2763]) +9 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][141] -> [FAIL][142] ([Intel XE#718])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2446])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][144] -> [INCOMPLETE][145] ([Intel XE#3468]) +2 other tests incomplete
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_pm_rpm@cursor.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [PASS][146] -> [SKIP][147] ([Intel XE#2446]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1439] / [Intel XE#3141])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [PASS][149] -> [DMESG-WARN][150] ([Intel XE#2042] / [Intel XE#3466])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@kms_pm_rpm@drm-resources-equal.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][151] -> [DMESG-WARN][152] ([Intel XE#3468]) +1 other test dmesg-warn
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2893]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#1489]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2387]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1128])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-render@edp-1:
    - shard-lnl:          [PASS][157] -> [DMESG-WARN][158] ([Intel XE#3466]) +90 other tests dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@kms_psr@fbc-psr-cursor-render@edp-1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1406]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-5/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#3414]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#3414]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#3414])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2330])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][166] ([Intel XE#3468]) +1 other test dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#1499])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#756]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-6/igt@kms_writeback@writeback-fb-id.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][169] -> [SKIP][170] ([Intel XE#2423])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@testdisplay.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#1123])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#2905]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-3/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2905]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#2905])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][175] ([Intel XE#1473] / [Intel XE#3468])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#688]) +5 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#1130]) +63 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2322]) +8 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#1392]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - shard-lnl:          [PASS][180] -> [DMESG-FAIL][181] ([Intel XE#3466]) +2 other tests dmesg-fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#288]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-bmg:          [PASS][183] -> [DMESG-WARN][184] ([Intel XE#3468] / [Intel XE#3514])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][185] -> [DMESG-WARN][186] ([Intel XE#3468]) +135 other tests dmesg-warn
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][187] -> [DMESG-FAIL][188] ([Intel XE#3371] / [Intel XE#3468])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][189] -> [DMESG-WARN][190] ([Intel XE#3467] / [Intel XE#3468])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][191] ([Intel XE#1999]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2457])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#378])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][194] -> [DMESG-WARN][195] ([Intel XE#3467]) +1 other test dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_module_load@many-reload.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2248])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#2541])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#2284] / [Intel XE#366])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2284])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          [PASS][200] -> [DMESG-WARN][201] ([Intel XE#3468] / [Intel XE#569])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_pm@s3-vm-bind-unbind-all.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][202] -> [ABORT][203] ([Intel XE#1794])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][204] -> [FAIL][205] ([Intel XE#958])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#944]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#3342])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-7/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][208] -> [SKIP][209] ([Intel XE#1130]) +185 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][210] ([Intel XE#2919])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [ABORT][211] ([Intel XE#3421])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][212] ([Intel XE#3466]) +1 other test dmesg-warn
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][213] ([Intel XE#3440]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@core_getversion@all-cards.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [DMESG-WARN][215] ([Intel XE#3521]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#3453]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2134]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@fbdev@nullptr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@fbdev@nullptr.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2423]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_3d.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_3d.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2423] / [i915#2575]) -> [PASS][224] +62 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][225] ([Intel XE#2613]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][227] -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [INCOMPLETE][229] ([Intel XE#3466]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][231] ([Intel XE#3468]) -> [PASS][232] +14 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][233] ([Intel XE#2705]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][235] ([Intel XE#1195] / [Intel XE#3226]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [DMESG-WARN][237] ([Intel XE#3468]) -> [PASS][238] +113 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][239] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][241] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - shard-lnl:          [FAIL][243] ([Intel XE#886]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136]) -> [PASS][246] +19 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][248] +9 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][249] ([Intel XE#3466]) -> [PASS][250] +41 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][251] ([Intel XE#2566]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][253] ([Intel XE#1430]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2446]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][257] ([Intel XE#2042]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-dg2-set2:     [DMESG-WARN][259] ([Intel XE#3468]) -> [PASS][260] +5 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [FAIL][261] ([Intel XE#3536]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-2/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [INCOMPLETE][263] ([Intel XE#1727]) -> [PASS][264] +3 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-busy.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_vblank@query-busy.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1130]) -> [PASS][266] +133 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     [DMESG-WARN][267] ([Intel XE#1727]) -> [PASS][268] +3 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_exec_basic@twice-userptr.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-lnl:          [DMESG-FAIL][269] ([Intel XE#3466]) -> [PASS][270] +4 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][271] ([Intel XE#3371]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][273] ([Intel XE#3467]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][275] ([Intel XE#2998]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][277] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-FAIL][279] ([Intel XE#1727]) -> [PASS][280] +1 other test pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-bmg:          [DMESG-WARN][281] ([Intel XE#1727]) -> [PASS][282] +8 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1885]) -> [DMESG-WARN][284] ([Intel XE#3468]) +1 other test dmesg-warn
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_hotunplug@hotrebind.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][285] ([Intel XE#3521]) -> [SKIP][286] ([Intel XE#1885])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#316]) -> [SKIP][288] ([Intel XE#2136] / [Intel XE#2351])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#316]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][292] ([Intel XE#316])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#316]) -> [SKIP][294] ([Intel XE#2136]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136]) -> [SKIP][296] ([Intel XE#1124]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1124]) -> [SKIP][298] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][300] ([Intel XE#619])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][302] ([Intel XE#1124]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1124]) -> [SKIP][304] ([Intel XE#2136]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2191]) -> [SKIP][306] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [SKIP][308] ([Intel XE#2191]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#367]) -> [SKIP][310] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#367]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][314] ([Intel XE#2136]) +11 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#2907]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2907]) -> [SKIP][318] ([Intel XE#2136])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][320] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#3442]) -> [SKIP][324] ([Intel XE#2136])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][325] ([Intel XE#616]) -> [SKIP][326] ([Intel XE#2136])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136]) -> [SKIP][328] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#306]) -> [SKIP][330] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#306]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#373]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#373]) +8 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-dg2-set2:     [DMESG-WARN][337] ([Intel XE#1727]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_color@invalid-degamma-lut-sizes.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][339] ([Intel XE#1178]) -> [INCOMPLETE][340] ([Intel XE#2715] / [Intel XE#3468]) +3 other tests incomplete
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_content_protection@atomic.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [FAIL][342] ([Intel XE#1178])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#307]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][345] ([Intel XE#1178]) -> [SKIP][346] ([Intel XE#2341])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_content_protection@legacy.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][347] ([Intel XE#1178]) -> [SKIP][348] ([Intel XE#2423] / [i915#2575])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_content_protection@srm.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2423] / [i915#2575]) -> [FAIL][350] ([Intel XE#1188])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_content_protection@uevent.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2423] / [i915#2575]) -> [SKIP][352] ([Intel XE#308]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#308]) -> [SKIP][354] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2423] / [i915#2575]) -> [SKIP][356] ([Intel XE#455]) +11 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-bmg:          [DMESG-FAIL][357] ([Intel XE#3468]) -> [DMESG-WARN][358] ([Intel XE#3468])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_cursor_edge_walk@128x128-left-edge.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][359] ([Intel XE#1475]) -> [SKIP][360] ([Intel XE#2423] / [i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2423] / [i915#2575]) -> [SKIP][362] ([Intel XE#323])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][363] ([Intel XE#2141]) -> [DMESG-FAIL][364] ([Intel XE#3468]) +2 other tests dmesg-fail
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#455]) -> [SKIP][366] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136]) -> [INCOMPLETE][368] ([Intel XE#3468])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#776]) -> [SKIP][370] ([Intel XE#2136]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2423] / [i915#2575]) -> [SKIP][372] ([Intel XE#1135])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][373] ([Intel XE#2882]) -> [SKIP][374] ([Intel XE#2316])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][375] ([Intel XE#301]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][377] ([Intel XE#2597]) -> [ABORT][378] ([Intel XE#3468])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][379] ([Intel XE#3468]) -> [ABORT][380] ([Intel XE#3468])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][381] ([Intel XE#1727]) -> [SKIP][382] ([Intel XE#2423] / [i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2423] / [i915#2575]) -> [FAIL][384] ([Intel XE#301])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][386] ([Intel XE#2049] / [Intel XE#2597])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][387] ([Intel XE#1195] / [Intel XE#1727]) -> [SKIP][388] ([Intel XE#2136])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][389] ([Intel XE#1195] / [Intel XE#3468]) -> [SKIP][390] ([Intel XE#2136] / [Intel XE#2351])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#455]) -> [SKIP][392] ([Intel XE#2136]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][394] ([Intel XE#455])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136]) -> [SKIP][396] ([Intel XE#455]) +2 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][397] ([Intel XE#2311]) -> [SKIP][398] ([Intel XE#2312]) +13 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#651]) -> [SKIP][400] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][402] ([Intel XE#651]) +8 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [FAIL][403] ([Intel XE#2333]) -> [DMESG-FAIL][404] ([Intel XE#3468]) +14 other tests dmesg-fail
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2-set2:     [INCOMPLETE][405] ([Intel XE#1195]) -> [SKIP][406] ([Intel XE#2136])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
    - shard-bmg:          [INCOMPLETE][407] ([Intel XE#3468]) -> [FAIL][408] ([Intel XE#2333])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][409] ([Intel XE#2333]) -> [SKIP][410] ([Intel XE#2312]) +5 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][411] ([Intel XE#3468]) -> [FAIL][412] ([Intel XE#2333]) +9 other tests fail
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [INCOMPLETE][413] ([Intel XE#1195] / [Intel XE#3468]) -> [SKIP][414] ([Intel XE#2136])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#651]) -> [SKIP][416] ([Intel XE#2136]) +26 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2136]) -> [SKIP][418] ([Intel XE#651]) +20 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2136]) -> [SKIP][420] ([Intel XE#653]) +20 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][421] ([Intel XE#2313]) -> [SKIP][422] ([Intel XE#2312]) +14 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#653]) -> [SKIP][424] ([Intel XE#2136]) +31 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][426] ([Intel XE#653]) +7 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#653]) -> [SKIP][428] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#605]) -> [SKIP][430] ([Intel XE#2423] / [i915#2575])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2925]) -> [SKIP][432] ([Intel XE#2136])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2423] / [i915#2575]) -> [FAIL][434] ([Intel XE#361])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][436] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2136]) -> [SKIP][438] ([Intel XE#870])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2938]) -> [SKIP][440] ([Intel XE#2136])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#870]) -> [SKIP][442] ([Intel XE#2136])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#3309]) -> [SKIP][444] ([Intel XE#2136])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][446] ([Intel XE#1129])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#908])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][449] ([Intel XE#2864]) -> [INCOMPLETE][450] ([Intel XE#2864] / [Intel XE#3468])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-dg2-set2:     [ABORT][451] ([Intel XE#3468]) -> [SKIP][452] ([Intel XE#2446])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1489]) -> [SKIP][454] ([Intel XE#2136]) +10 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2136]) -> [SKIP][456] ([Intel XE#1489]) +9 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1122]) -> [SKIP][458] ([Intel XE#2136]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2136]) -> [SKIP][460] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][462] ([Intel XE#2136]) +15 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][464] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr-cursor-render.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][466] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_psr@psr-dpms.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][468] ([Intel XE#2351]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2136]) -> [SKIP][470] ([Intel XE#2939])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#3414]) -> [SKIP][472] ([Intel XE#2423] / [i915#2575])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1127]) -> [SKIP][474] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2423] / [i915#2575]) -> [SKIP][476] ([Intel XE#3414])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2423] / [i915#2575]) -> [FAIL][478] ([Intel XE#1729])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][480] ([Intel XE#3468])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#455]) -> [SKIP][482] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_vrr@flip-dpms.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][483] -> [SKIP][484] ([Intel XE#1499])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#2423] / [i915#2575]) -> [SKIP][486] ([Intel XE#756])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#756]) -> [SKIP][488] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][490] ([Intel XE#1130]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1126]) -> [SKIP][492] ([Intel XE#1130]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2905]) -> [SKIP][494] ([Intel XE#1130]) +17 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1130]) -> [SKIP][496] ([Intel XE#2905]) +9 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_eudebug@sysfs-toggle.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][497] ([Intel XE#2364]) -> [DMESG-FAIL][498] ([Intel XE#3468])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [INCOMPLETE][499] ([Intel XE#1195]) -> [SKIP][500] ([Intel XE#1130])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#288]) -> [SKIP][502] ([Intel XE#1130]) +34 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1130]) -> [SKIP][504] ([Intel XE#288]) +25 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#2360]) -> [SKIP][506] ([Intel XE#1130])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#1130]) -> [SKIP][508] ([Intel XE#2360]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][509] ([Intel XE#3467]) -> [DMESG-WARN][510] ([Intel XE#3468])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][511] ([Intel XE#3467]) -> [SKIP][512] ([Intel XE#1130]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [DMESG-WARN][513] ([Intel XE#3343]) -> [SKIP][514] ([Intel XE#1130]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][515] ([Intel XE#3343]) -> [DMESG-WARN][516] ([Intel XE#3343] / [Intel XE#3468])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#1130]) -> [DMESG-WARN][518] ([Intel XE#3343])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][519] ([Intel XE#3499]) -> [DMESG-FAIL][520] ([Intel XE#3467] / [Intel XE#3468])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][521] ([Intel XE#3499]) -> [FAIL][522] ([Intel XE#3499] / [Intel XE#3539]) +3 other tests fail
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-bmg:          [FAIL][523] ([Intel XE#3499]) -> [DMESG-FAIL][524] ([Intel XE#3468])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1130]) -> [DMESG-WARN][526] ([Intel XE#3467]) +2 other tests dmesg-warn
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
    - shard-bmg:          [FAIL][527] ([Intel XE#3499]) -> [DMESG-FAIL][528] ([Intel XE#3467])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][529] ([Intel XE#3467]) -> [FAIL][530] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][531] ([Intel XE#3467]) -> [DMESG-WARN][532] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1130]) -> [SKIP][534] ([Intel XE#255])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#1192]) -> [FAIL][536] ([Intel XE#1999])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_live_ktest@xe_mocs.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#1130]) -> [SKIP][538] ([Intel XE#560])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#2541]) -> [SKIP][540] ([Intel XE#1130]) +10 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1130]) -> [SKIP][542] ([Intel XE#2541]) +8 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][543] ([Intel XE#1173]) -> [SKIP][544] ([Intel XE#1061])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_peer2peer@write.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#1130]) -> [SKIP][546] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][547] ([Intel XE#569]) -> [SKIP][548] ([Intel XE#1130])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][550] ([Intel XE#1130])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][551] ([Intel XE#569]) -> [DMESG-WARN][552] ([Intel XE#3468] / [Intel XE#569])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_pm@s3-d3hot-basic-exec.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [DMESG-WARN][553] ([Intel XE#3466]) -> [ABORT][554] ([Intel XE#1358] / [Intel XE#1607])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#1130]) -> [SKIP][556] ([Intel XE#944]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#944]) -> [SKIP][558] ([Intel XE#1130]) +2 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#3342]) -> [SKIP][560] ([Intel XE#1130])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-dg2-set2:     [DMESG-WARN][561] ([Intel XE#1727]) -> [SKIP][562] ([Intel XE#1130]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-434/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][563] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][564] ([Intel XE#1130])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html

  
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
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
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
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
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
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12148
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99

  IGTPW_12148: 12148
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99: 0cb17ecec562c61d45997a2fced4e5ed99b31f99

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12148/index.html
