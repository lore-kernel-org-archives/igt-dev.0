Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E75CC79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 07:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0EE10E252;
	Thu, 10 Sep 2026 07:54:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9651210E252;
 Thu, 10 Sep 2026 07:53:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3444378477391790059=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel/perf=5Fpmu=3A_?=
 =?utf-8?q?Fix_double_free_of_drpc_in_test=5Frc6_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: krishnaveni.palanisamy@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Sep 2026 07:53:25 -0000
Message-ID: <178902680559.145374.16701998958724518366@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909055236.52492-1-krishnaveni.palanisamy@intel.com>
In-Reply-To: <20260909055236.52492-1-krishnaveni.palanisamy@intel.com>
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

--===============3444378477391790059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/perf_pmu: Fix double free of drpc in test_rc6 (rev3)
URL   : https://patchwork.freedesktop.org/series/173664/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9088_FULL -> XEIGTPW_15817_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15817_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15817_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15817_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-9:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-9.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-9.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15817_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#8098]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2328] / [Intel XE#7367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1467] / [Intel XE#7367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#8365])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2669] / [Intel XE#7389]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#9204] / [Intel XE#9219]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_cdclk@plane-scaling.html
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2724] / [Intel XE#7449])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#9219]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7358])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6974])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7642])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1424])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-tearing-position-change:
    - shard-lnl:          [PASS][31] -> [SKIP][32] ([Intel XE#9125]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_cursor_crc@cursor-tearing-position-change.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_cursor_crc@cursor-tearing-position-change.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2286] / [Intel XE#6035])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4210] / [Intel XE#7467])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1508])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#8265])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#9125])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#8265]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4156] / [Intel XE#7425])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-lnl:          [PASS][40] -> [SKIP][41] ([Intel XE#8680])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_fbcon_fbt@psr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1138] / [Intel XE#7344])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1138] / [Intel XE#7344])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#6266]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2482])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#301])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-lnl:          [PASS][49] -> [SKIP][50] ([Intel XE#2482]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_flip@flip-vs-panning-vs-hang.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7178] / [Intel XE#7351])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [PASS][54] -> [SKIP][55] ([Intel XE#7779]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2548] / [Intel XE#7779])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4141]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#6312] / [Intel XE#651])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7779])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2311]) +23 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7061]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6312]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#7905]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7865]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#656] / [Intel XE#7905]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7061] / [Intel XE#7356])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-lnl:          [PASS][68] -> [SKIP][69] ([Intel XE#2548] / [Intel XE#7779]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2313]) +35 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#2568])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@kms_invalid_mode@bad-htotal.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6901])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#8303]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7283]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_pm_backlight@fade:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#870])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@kms_pm_backlight@fade.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#8396]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#8399])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1489]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#4608]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#7345])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1406]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [PASS][90] -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_psr@psr2-sprite-render.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#3904] / [Intel XE#7342])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1435] / [Intel XE#8695])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#6503]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1499])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@runner@aborted:
    - shard-lnl:          NOTRUN -> [FAIL][96] ([Intel XE#8990])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@runner@aborted.html

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7482]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@xe_exec_balancer@twice-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8374]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#8374])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#8364]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#8364]) +16 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8369]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#8369]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#8378]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#8378])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_madvise@atomic-cpu:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#7980])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@xe_madvise@atomic-cpu.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#6964])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#7793])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#5694] / [Intel XE#7370])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4733] / [Intel XE#7417])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#944]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][113] -> [FAIL][114] ([Intel XE#6569])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-bmg:          [PASS][115] -> [FAIL][116] ([Intel XE#7992]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-1/igt@xe_sriov_vram@vf-access-after-resize-up.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-lnl:          [SKIP][117] ([Intel XE#2134]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@fbdev@read.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@fbdev@read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][119] ([Intel XE#8583]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@intel_hwmon@hwmon-write.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][121] ([Intel XE#9125]) -> [PASS][122] +65 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][123] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@ctm-0-75:
    - shard-lnl:          [SKIP][125] ([Intel XE#3297]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color@ctm-0-75.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_color@ctm-0-75.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          [SKIP][127] ([Intel XE#7006]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_dp_aux_dev@basic:
    - shard-lnl:          [SKIP][129] ([Intel XE#3009]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dp_aux_dev@basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_dp_aux_dev@basic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [SKIP][131] ([Intel XE#9127]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [SKIP][133] ([Intel XE#1135]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_feature_discovery@psr1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][135] ([Intel XE#301]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [SKIP][137] ([Intel XE#2482]) -> [PASS][138] +12 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][139] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-lnl:          [SKIP][141] ([Intel XE#2682]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][143] ([Intel XE#7779]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-lnl:          [SKIP][145] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][146] +23 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][147] ([Intel XE#2568]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-lnl:          [SKIP][149] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][151] ([Intel XE#9128]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:
    - shard-lnl:          [SKIP][153] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][154] +9 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][155] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][156] +9 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [SKIP][157] ([Intel XE#870]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][159] ([Intel XE#8399]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [SKIP][161] ([Intel XE#7794]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [SKIP][163] ([Intel XE#7106]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [SKIP][165] ([Intel XE#4886]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-lnl:          [SKIP][167] ([Intel XE#9129]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][169] ([Intel XE#1489]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [SKIP][171] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][172] +9 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [ABORT][173] ([Intel XE#7774]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0:
    - shard-bmg:          [ABORT][175] ([Intel XE#9206]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0:
    - shard-bmg:          [DMESG-FAIL][177] ([Intel XE#7774]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1:
    - shard-bmg:          [INCOMPLETE][179] ([Intel XE#7774] / [Intel XE#8654]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html

  * igt@xe_exec_reset@gt-stress-reset-rapid-cycle:
    - shard-lnl:          [INCOMPLETE][181] ([Intel XE#8652]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:
    - shard-bmg:          [FAIL][183] ([Intel XE#9115]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][185] ([Intel XE#9096]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-lnl:          [SKIP][187] ([Intel XE#7590] / [Intel XE#9125]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@xe_pat@display-vs-wb-transient.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][189] ([Intel XE#3658] / [Intel XE#7360]) -> [SKIP][190] ([Intel XE#9125])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][191] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][192] ([Intel XE#9125])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][193] ([Intel XE#9125]) -> [SKIP][194] ([Intel XE#7059] / [Intel XE#7085])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-lnl:          [SKIP][195] ([Intel XE#9125]) -> [SKIP][196] ([Intel XE#1407]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          [SKIP][197] ([Intel XE#1407]) -> [SKIP][198] ([Intel XE#9125])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][199] ([Intel XE#1124]) -> [SKIP][200] ([Intel XE#9125]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          [SKIP][201] ([Intel XE#9125]) -> [SKIP][202] ([Intel XE#1124]) +9 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][203] ([Intel XE#9125]) -> [SKIP][204] ([Intel XE#1467] / [Intel XE#7367])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][205] ([Intel XE#9125]) -> [SKIP][206] ([Intel XE#1428] / [Intel XE#7387])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][207] ([Intel XE#7679]) -> [SKIP][208] ([Intel XE#9125])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][209] ([Intel XE#9125]) -> [SKIP][210] ([Intel XE#7679]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][211] ([Intel XE#9125]) -> [SKIP][212] ([Intel XE#8365]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][213] ([Intel XE#9125]) -> [SKIP][214] ([Intel XE#367])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][215] ([Intel XE#9125]) -> [SKIP][216] ([Intel XE#3432]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][217] ([Intel XE#9125]) -> [SKIP][218] ([Intel XE#2887]) +19 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][219] ([Intel XE#2887]) -> [SKIP][220] ([Intel XE#9125]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][221] ([Intel XE#9125]) -> [SKIP][222] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][223] ([Intel XE#9125]) -> [SKIP][224] ([Intel XE#7008])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          [SKIP][225] ([Intel XE#7642]) -> [SKIP][226] ([Intel XE#9125])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_content_protection@atomic-dpms.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][227] ([Intel XE#9125]) -> [SKIP][228] ([Intel XE#6974]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][229] ([Intel XE#9125]) -> [SKIP][230] ([Intel XE#1468] / [Intel XE#7396])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@mei-interface.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          [SKIP][231] ([Intel XE#9125]) -> [SKIP][232] ([Intel XE#7642]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@type1.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          [SKIP][233] ([Intel XE#1424]) -> [SKIP][234] ([Intel XE#9125])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][235] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][236] ([Intel XE#9125])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][237] ([Intel XE#9125]) -> [SKIP][238] ([Intel XE#1424]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          [SKIP][239] ([Intel XE#9125]) -> [SKIP][240] ([Intel XE#2321] / [Intel XE#7355])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          [SKIP][241] ([Intel XE#9125]) -> [SKIP][242] ([Intel XE#309] / [Intel XE#7343]) +5 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][243] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][244] ([Intel XE#309] / [Intel XE#7343])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][245] ([Intel XE#9125]) -> [SKIP][246] ([Intel XE#323] / [Intel XE#6035]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][247] ([Intel XE#9125]) -> [SKIP][248] ([Intel XE#4354] / [Intel XE#5882])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          [SKIP][249] ([Intel XE#9009]) -> [SKIP][250] ([Intel XE#9125])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-lnl:          [SKIP][251] ([Intel XE#9125]) -> [SKIP][252] ([Intel XE#8265]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][253] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][254] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][255] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][256] ([Intel XE#7779]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          [SKIP][257] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][258] ([Intel XE#6312] / [Intel XE#651]) +13 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][259] ([Intel XE#6312]) -> [SKIP][260] ([Intel XE#7779])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][261] ([Intel XE#7905]) -> [SKIP][262] ([Intel XE#7779]) +7 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          [SKIP][263] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][264] ([Intel XE#1469] / [Intel XE#7399])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][265] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][266] ([Intel XE#2548] / [Intel XE#7779]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][267] ([Intel XE#7779]) -> [SKIP][268] ([Intel XE#6312]) +19 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][269] ([Intel XE#7779]) -> [SKIP][270] ([Intel XE#7399])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][271] ([Intel XE#7779]) -> [SKIP][272] ([Intel XE#7865]) +31 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-1p-rte:
    - shard-lnl:          [SKIP][273] ([Intel XE#7865]) -> [SKIP][274] ([Intel XE#7779]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-rte.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][275] ([Intel XE#7779]) -> [SKIP][276] ([Intel XE#7905]) +51 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][277] ([Intel XE#7779]) -> [SKIP][278] ([Intel XE#7061]) +13 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][279] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][280] ([Intel XE#656] / [Intel XE#7905]) +45 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][281] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][282] ([Intel XE#2548] / [Intel XE#7779]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][283] ([Intel XE#7779]) -> [SKIP][284] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][285] ([Intel XE#9125]) -> [SKIP][286] ([Intel XE#6912] / [Intel XE#7375])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          [SKIP][287] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375]) -> [SKIP][288] ([Intel XE#9125])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          [SKIP][289] ([Intel XE#9125]) -> [SKIP][290] ([Intel XE#4596] / [Intel XE#5854])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          [SKIP][291] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][292] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          [SKIP][293] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][294] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][295] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][296] ([Intel XE#1489])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [SKIP][297] ([Intel XE#1489]) -> [SKIP][298] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][299] ([Intel XE#1489]) -> [SKIP][300] ([Intel XE#2893] / [Intel XE#7304]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-lnl:          [SKIP][301] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][302] ([Intel XE#2850] / [Intel XE#929])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_psr@fbc-psr2-basic.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [SKIP][303] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][304] ([Intel XE#1406] / [Intel XE#7345]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          [SKIP][305] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][306] ([Intel XE#1406]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][307] ([Intel XE#9125]) -> [SKIP][308] ([Intel XE#1127] / [Intel XE#5813])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          [SKIP][309] ([Intel XE#9125]) -> [SKIP][310] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][311] ([Intel XE#9125]) -> [SKIP][312] ([Intel XE#1499])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][313] ([Intel XE#9130]) -> [ABORT][314] ([Intel XE#9145])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_reset@gt-reset-fault-injection.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][315] ([Intel XE#6569]) -> [FAIL][316] ([Intel XE#7992])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [ABORT][317] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][318] ([Intel XE#8963])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8654
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#8990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
  [Intel XE#9206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9206
  [Intel XE#9219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9088 -> IGTPW_15817
  * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-5716-06a7934b744f58f0264164fe6173f00c22b47bc4

  IGTPW_15817: fa6554e4c5fd36e48666a2e3818196ecb158b90b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
  xe-5716-06a7934b744f58f0264164fe6173f00c22b47bc4: 06a7934b744f58f0264164fe6173f00c22b47bc4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/index.html

--===============3444378477391790059==
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
<tr><td><b>Series:</b></td><td>tests/intel/perf_pmu: Fix double free of drpc in test_rc6 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173664/">https://patchwork.freedesktop.org/series/173664/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9088_FULL -&gt; XEIGTPW_15817_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15817_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15817_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15817_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-9:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-9.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-9.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15817_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#8098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204">Intel XE#9204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219">Intel XE#9219</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219">Intel XE#9219</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_cursor_crc@cursor-tearing-position-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_cursor_crc@cursor-tearing-position-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_fbcon_fbt@psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@kms_invalid_mode@bad-htotal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@kms_pm_backlight@fade.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_psr@psr2-sprite-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990">Intel XE#8990</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@xe_exec_balancer@twice-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@xe_madvise@atomic-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@xe_multigpu_svm@mgpu-coherency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-9/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-1/igt@xe_sriov_vram@vf-access-after-resize-up.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@xe_sriov_vram@vf-access-after-resize-up.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +65 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_color@ctm-0-75.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_dp_aux_dev@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel XE#9127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_feature_discovery@psr1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682">Intel XE#2682</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_invalid_mode@bad-vtotal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-modifier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_plane@plane-position-hole.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_properties@plane-properties-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9206">Intel XE#9206</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8654">Intel XE#8654</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-rapid-cycle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@xe_pat@display-vs-wb-transient.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-1/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-6/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-10/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-5/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591">Intel XE#8591</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15817/shard-bmg-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9088 -&gt; IGTPW_15817</li>
<li>Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -&gt; xe-5716-06a7934b744f58f0264164fe6173f00c22b47bc4</li>
</ul>
<p>IGTPW_15817: fa6554e4c5fd36e48666a2e3818196ecb158b90b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada<br />
  xe-5716-06a7934b744f58f0264164fe6173f00c22b47bc4: 06a7934b744f58f0264164fe6173f00c22b47bc4</p>

</body>
</html>

--===============3444378477391790059==--
