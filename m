Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE28E63F3D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 09:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD8510E0B8;
	Mon, 16 Feb 2026 09:20:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C65A10E0B8;
 Mon, 16 Feb 2026 09:20:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8609100583747601704=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_kms=5Fflip=3A_limit_number?=
 =?utf-8?q?_of_subtests_run_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Feb 2026 09:20:34 -0000
Message-ID: <177123363454.255555.1717647215479203813@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213084930.252273-1-michal.grzelak@intel.com>
In-Reply-To: <20260213084930.252273-1-michal.grzelak@intel.com>
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

--===============8609100583747601704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_flip: limit number of subtests run (rev5)
URL   : https://patchwork.freedesktop.org/series/161389/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8753_FULL -> XEIGTPW_14554_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14554_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14554_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14554_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  
New tests
---------

  New tests have been introduced between XEIGT_8753_FULL and XEIGTPW_14554_FULL:

### New IGT tests (9) ###

  * igt@core_setmaster@master-drop-set-root:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@core_setmaster@master-drop-set-shared-fd:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@core_setmaster@master-drop-set-user:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.26] s

  * igt@kms_cursor_edge_walk@64x64-left-edge@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.37] s

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 12.97] s

  * igt@xe_exec_multi_queue:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
    - Statuses : 1 pass(s)
    - Exec time: [3.63] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14554_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3279])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +7 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2191])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1512])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#3432]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2724])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#306])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.html
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2325])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#6507])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][20] ([Intel XE#6968]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-edp-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178] / [Intel XE#3304]) +5 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3278])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#3304]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2341])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#309])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2244])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4422])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#702])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#301]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7178]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1397] / [Intel XE#1745])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1397])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7178]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#656]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#651])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2311]) +17 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7061]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7061])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2352])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +13 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6911])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6912])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6912])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4329] / [Intel XE#6912])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7250]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7111]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2393])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#5021])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#6886]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#870])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2505])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1406] / [Intel XE#2893])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1406])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1406] / [Intel XE#2414])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#3414] / [Intel XE#3904])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6503]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2168])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#4459]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1499])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#2142]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-client:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4837]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4837] / [Intel XE#6665])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6665])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#688])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7140])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2322]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1392])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7136])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7136]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6874]) +14 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#6874]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro:
    - shard-bmg:          [PASS][84] -> [INCOMPLETE][85] ([Intel XE#2594])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7138]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#6964]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6964])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2236])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2284])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#584])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4733])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#944])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#944])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#6569])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [FAIL][97] ([Intel XE#6747]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
    - shard-bmg:          [FAIL][99] ([Intel XE#6841]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][101] ([Intel XE#5299]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-bmg:          [ABORT][103] ([Intel XE#2705] / [Intel XE#4760] / [Intel XE#7169]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][105] ([Intel XE#6321]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [SKIP][132]) ([Intel XE#378]) -> ([PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-8/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-1/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-2/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-7/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-1/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-1/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-7/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-7/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-5/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-8/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-6/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-6/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-6/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-2/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-4/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-5/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-5/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-2/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-4/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-1/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [SKIP][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183]) ([Intel XE#2457]) -> ([PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-10/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-7/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-10/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-3/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-7/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-10/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-5/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-1/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-1/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][209] ([Intel XE#6569]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][211] ([Intel XE#2426]) -> [FAIL][212] ([Intel XE#1729])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8753 -> IGTPW_14554
  * Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -> xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc

  IGTPW_14554: 14554
  IGT_8753: 8753
  xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7c8967f71443264b92
  xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc: eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/index.html

--===============8609100583747601704==
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
<tr><td><b>Series:</b></td><td>kms_flip: limit number of subtests run (rev5=
)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161389/">https://patchwork.freedesktop.org/series/161389/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14554/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14554/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8753_FULL -&gt; XEIGTPW_14554_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14554_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14554_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
554_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s4-multiple-execs:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/i=
gt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8753_FULL and XEIGTPW_14554=
_FULL:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 12.97] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf=
-random:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14554_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_atomic_transition@plane-all-=
modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-d-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-after-=
hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_chamelium_sharpness_filter@f=
ilter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@kms_color_pipeline@plane-ctm3x4@=
pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6968">Intel XE#6968</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3304">Intel XE#3304</a>) +5 other tests fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_content_protection@lic-type-=
0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14554/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6912">Intel XE#6912</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7250">Intel XE#7250</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-m=
tl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7111">Intel XE#7111</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-update-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@kms_psr2_sf@pr-primary-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests =
skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@kms_psr@fbc-pr-primary-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14554/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_eudebug@basic-client.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837=
">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_eudebug@vma-ufence.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">=
Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@xe_eudebug_online@breakpoint-man=
y-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_eudebug_online@interrupt-reco=
nnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_eudebug_online@pagefault-one=
-of-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_evict@evict-beng-small-multi-=
vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_evict@evict-threads-small-mul=
ti-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-n=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueu=
es-multi-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueu=
es-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-fault-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +14 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@xe_exec_multi_queue@two-queues-p=
reempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-=
mmap-remap-ro.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_exec_system_allocator@many-larg=
e-execqueues-mmap-remap-ro.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-=
fail-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@xe_multigpu_svm@mgpu-migration-p=
refetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@xe_pm@s3-multiple-execs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard=
-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</l=
i>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747">=
Intel XE#6747</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14554/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-=
2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6841">Intel XE#6841</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@kms_cursor_edge_walk@256x256-to=
p-edge@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299=
">Intel XE#5299</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14554/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-9/igt@kms_cursor_legacy@short-flip-before-cursor-toggl=
e.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4760">Intel XE#4760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7169">Intel XE#7169</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@=
kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-sm=
all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8753/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8753/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8753/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8753/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8753/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8753/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-ln=
l-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8753/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
753/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8753/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8753/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8753/shard-lnl-1/igt@xe_module_load@load.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14554/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14554/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard=
-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
554/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14554/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14554/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14554/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14554/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14554/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-ln=
l-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14554/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8753/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8753/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8753/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8753/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_8753/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8753/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shar=
d-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/s=
hard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-10/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_87=
53/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_8753/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8753/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8753/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/shard-bmg-9/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8753/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_145=
54/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14554/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14554/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/sh=
ard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14554/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14554/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14554/shard-bmg-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_145=
54/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14554/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14554/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14554/shard-bmg-9/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14554/shard-bmg-2/igt@xe_module_load@load.=
html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE=
#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14554/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8753/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14554/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8753 -&gt; IGTPW_14554</li>
<li>Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -&gt; xe-4561-e=
ac0d1b8d00bd336f2db6f0a45f6c35cdac374bc</li>
</ul>
<p>IGTPW_14554: 14554<br />
  IGT_8753: 8753<br />
  xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7=
c8967f71443264b92<br />
  xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc: eac0d1b8d00bd336f2db6f0=
a45f6c35cdac374bc</p>

</body>
</html>

--===============8609100583747601704==--
