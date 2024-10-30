Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776E1D6B6CC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 19:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B3910E7EF;
	Wed, 30 Oct 2024 19:20:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1BD10E0CA;
 Wed, 30 Oct 2024 19:20:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7917828510775787484=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/amdgpu/amd=5Freplay=3A_?=
 =?utf-8?q?Add_some_page_flips_before_test_start_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Oct 2024 19:20:10 -0000
Message-ID: <173031601068.1364410.9559925519125667297@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030151714.2424-1-chiahsuan.chung@amd.com>
In-Reply-To: <20241030151714.2424-1-chiahsuan.chung@amd.com>
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

--===============7917828510775787484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Add some page flips before test start (rev2)
URL   : https://patchwork.freedesktop.org/series/140721/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8088_full -> XEIGTPW_12004_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12004_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12004_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12004_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12004_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3279])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#1701]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#1426]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][8] ([Intel XE#1426]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#1426]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][11] -> [DMESG-WARN][12] ([Intel XE#877])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> [DMESG-WARN][13] ([Intel XE#1725])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#607])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#619])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +69 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2890])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#616]) +7 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#3113])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#308])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#323])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#877])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#323]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#1541])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1340])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([i915#3804])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3070])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1135])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#301]) +7 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#301]) +7 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> [ABORT][52] ([Intel XE#2625]) +1 other test abort
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#886]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401] / [Intel XE#1745])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1401])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293]) +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#2351] / [Intel XE#2890])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#651]) +17 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#656]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1469])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +24 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#2333])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +12 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][65] -> [ABORT][66] ([Intel XE#2625]) +1 other test abort
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2925])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [PASS][68] -> [INCOMPLETE][69] ([Intel XE#2566])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#599]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][71] ([Intel XE#361]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2763]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2763]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2763] / [Intel XE#455])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2763]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#718])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#3309])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#1195] / [Intel XE#2864]) +1 other test incomplete
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#2893]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1489]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1406])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-page-flip@edp-1:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#2948]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_psr@psr2-primary-page-flip@edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_psr@psr2-primary-page-flip@edp-1.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#327]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][88] ([Intel XE#3209])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1437])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1127]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#899]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#2443]) +3 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_vrr@flip-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#756])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#1050])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1126]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2905]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2905]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][101] -> [TIMEOUT][102] ([Intel XE#1473])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][103] -> [FAIL][104] ([Intel XE#1000])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#688]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1392]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-bmg:          [PASS][107] -> [FAIL][108] ([Intel XE#3160]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#3160])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#288]) +19 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2360])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#255])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2541]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_oa@buffer-fill.html

  * igt@xe_pat@prime-external-import-coh:
    - shard-dg2-set2:     [PASS][115] -> [SKIP][116] ([Intel XE#1130])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@xe_pat@prime-external-import-coh.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@xe_pat@prime-external-import-coh.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2284] / [Intel XE#366])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2284] / [Intel XE#366])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][119] -> [ABORT][120] ([Intel XE#1794])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@xe_pm@s3-mocs.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][121] -> [ABORT][122] ([Intel XE#1358] / [Intel XE#1607])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-3/igt@xe_pm@s4-exec-after.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#944]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     NOTRUN -> [FAIL][124] ([Intel XE#2922])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@xe_tlb@basic-tlb.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][125] ([Intel XE#3296]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@core_getversion@all-cards.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][127] ([Intel XE#1885]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@core_hotunplug@hotrebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][129] ([Intel XE#2134]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@fbdev@unaligned-read.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@fbdev@unaligned-read.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [SKIP][131] ([Intel XE#2423]) -> [PASS][132] +128 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [FAIL][133] ([Intel XE#3105]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][135] ([Intel XE#2890]) -> [PASS][136] +24 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_color@ctm-0-25@pipe-a-edp-1:
    - shard-lnl:          [DMESG-WARN][137] ([Intel XE#2929]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-a-edp-1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_color@ctm-0-25@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][139] ([Intel XE#877]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#1475]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#301]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][145] ([Intel XE#3255] / [Intel XE#886]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][147] ([Intel XE#886]) -> [PASS][148] +8 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [SKIP][149] ([Intel XE#2231]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#2890]) -> [PASS][152] +3 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][153] ([Intel XE#616]) -> [PASS][154] +3 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-bmg:          [SKIP][155] ([Intel XE#3007]) -> [PASS][156] +8 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_plane_scaling@invalid-num-scalers.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2446]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [SKIP][159] ([Intel XE#2446]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][161] ([Intel XE#2042]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [FAIL][163] ([Intel XE#2948]) -> [PASS][164] +3 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-onoff.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2423] / [i915#2575]) -> [PASS][166] +8 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][167] ([Intel XE#2159]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][169] ([Intel XE#2443]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-1/igt@kms_vrr@max-min.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_vrr@max-min.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-bmg:          [FAIL][171] -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@xe_compute_preempt@compute-preempt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          [SKIP][173] ([Intel XE#1130]) -> [PASS][174] +271 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][175] ([Intel XE#1600]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][177] ([Intel XE#1000]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@once-basic:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1130]) -> [PASS][180] +18 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_exec_compute_mode@once-basic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_exec_compute_mode@once-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][181] ([Intel XE#3160]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][183] ([Intel XE#3160]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][185] -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][187] ([Intel XE#3184]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-bmg:          [SKIP][189] ([Intel XE#2229]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][191] ([Intel XE#1358]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][193] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][195] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_tlb@basic-tlb:
    - shard-bmg:          [CRASH][197] ([Intel XE#3212]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@xe_tlb@basic-tlb.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@xe_tlb@basic-tlb.html
    - shard-lnl:          [CRASH][199] ([Intel XE#3212]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@xe_tlb@basic-tlb.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@xe_tlb@basic-tlb.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][201] ([Intel XE#2423]) -> [SKIP][202] ([Intel XE#2233])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][203] ([Intel XE#3007]) -> [SKIP][204] ([Intel XE#873])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2423] / [i915#2575]) -> [SKIP][206] ([Intel XE#873])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][207] ([Intel XE#2423]) -> [SKIP][208] ([Intel XE#2370])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][209] ([Intel XE#2890]) -> [SKIP][210] ([Intel XE#2327]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][211] ([Intel XE#2231]) -> [SKIP][212] ([Intel XE#2327])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2890]) -> [SKIP][214] ([Intel XE#316])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][215] ([Intel XE#2890]) -> [SKIP][216] ([Intel XE#1124]) +15 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][217] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][218] ([Intel XE#1124])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][220] ([Intel XE#1124])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][221] ([Intel XE#2423]) -> [SKIP][222] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][223] ([Intel XE#3007]) -> [SKIP][224] ([Intel XE#367])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][225] ([Intel XE#2423]) -> [SKIP][226] ([Intel XE#367]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][227] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][228] ([Intel XE#2887]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2890]) -> [SKIP][230] ([Intel XE#455] / [Intel XE#787])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][231] ([Intel XE#2887]) -> [SKIP][232] ([Intel XE#2231] / [Intel XE#2890])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][233] ([Intel XE#2231]) -> [SKIP][234] ([Intel XE#2887])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2890]) -> [FAIL][236] ([Intel XE#616])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][237] ([Intel XE#1195] / [Intel XE#2692]) -> [INCOMPLETE][238] ([Intel XE#1195] / [Intel XE#1727])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][239] ([Intel XE#2890]) -> [SKIP][240] ([Intel XE#2887]) +21 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][241] ([Intel XE#1195] / [Intel XE#3113]) -> [DMESG-WARN][242] ([Intel XE#3113])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][243] ([Intel XE#2890]) -> [SKIP][244] ([Intel XE#2724])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2423] / [i915#2575]) -> [SKIP][246] ([Intel XE#373]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][247] ([Intel XE#2423]) -> [SKIP][248] ([Intel XE#2325]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][249] ([Intel XE#2423]) -> [SKIP][250] ([Intel XE#2252]) +14 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-bmg:          [SKIP][251] ([Intel XE#3007]) -> [SKIP][252] ([Intel XE#2252]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][253] ([Intel XE#2423]) -> [FAIL][254] ([Intel XE#1178])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_content_protection@atomic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][255] ([Intel XE#2423]) -> [SKIP][256] ([Intel XE#2390]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][257] ([Intel XE#3007]) -> [SKIP][258] ([Intel XE#2320])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][259] ([Intel XE#2423]) -> [SKIP][260] ([Intel XE#2321]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][261] ([Intel XE#2423]) -> [SKIP][262] ([Intel XE#2320]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][263] ([Intel XE#2890]) -> [SKIP][264] ([Intel XE#1508])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][265] ([Intel XE#2890]) -> [SKIP][266] ([Intel XE#2244]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_dsc@dsc-basic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][267] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][268] ([Intel XE#2244])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_dsc@dsc-with-formats.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][269] ([Intel XE#2890]) -> [FAIL][270] ([Intel XE#1695])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][271] ([Intel XE#2890]) -> [SKIP][272] ([Intel XE#776])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][273] ([Intel XE#2423]) -> [SKIP][274] ([Intel XE#2373])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][275] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][276] ([Intel XE#2293] / [Intel XE#2380])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][277] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][278] ([Intel XE#2231] / [Intel XE#2890])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455]) -> [SKIP][280] ([Intel XE#2890])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][281] ([Intel XE#2890]) -> [SKIP][282] ([Intel XE#2293] / [Intel XE#2380]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][283] ([Intel XE#2890]) -> [SKIP][284] ([Intel XE#2311]) +42 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-bmg:          [SKIP][285] ([Intel XE#2311]) -> [SKIP][286] ([Intel XE#2231] / [Intel XE#2890])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][288] ([Intel XE#651]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][289] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][290] ([Intel XE#2333]) +2 other tests fail
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][291] ([Intel XE#2890]) -> [FAIL][292] ([Intel XE#2333]) +18 other tests fail
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [SKIP][293] ([Intel XE#2231]) -> [FAIL][294] ([Intel XE#2333])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][295] ([Intel XE#2231]) -> [SKIP][296] ([Intel XE#2311]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2890]) -> [SKIP][298] ([Intel XE#651]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
    - shard-bmg:          [SKIP][299] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][300] ([Intel XE#2311]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][301] ([Intel XE#2890]) -> [SKIP][302] ([Intel XE#2350])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][303] ([Intel XE#2890]) -> [SKIP][304] ([Intel XE#2313]) +43 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][305] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][306] ([Intel XE#2313]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2890]) -> [SKIP][308] ([Intel XE#653]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][309] ([Intel XE#2890]) -> [SKIP][310] ([Intel XE#346])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][311] ([Intel XE#2423]) -> [SKIP][312] ([Intel XE#2501])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][313] ([Intel XE#2423]) -> [SKIP][314] ([Intel XE#2763])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-bmg:          [SKIP][315] ([Intel XE#3007]) -> [SKIP][316] ([Intel XE#2763])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423] / [i915#2575]) -> [SKIP][318] ([Intel XE#2763] / [Intel XE#455])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][319] ([Intel XE#2890]) -> [SKIP][320] ([Intel XE#870])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][321] ([Intel XE#2890]) -> [SKIP][322] ([Intel XE#2938])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][323] ([Intel XE#2890]) -> [SKIP][324] ([Intel XE#2391])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][325] ([Intel XE#2890]) -> [FAIL][326] ([Intel XE#1430])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][327] ([Intel XE#2890]) -> [SKIP][328] ([Intel XE#2392])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][329] ([Intel XE#2446]) -> [SKIP][330] ([Intel XE#1439] / [Intel XE#3141])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][331] ([Intel XE#2446]) -> [SKIP][332] ([Intel XE#1439])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][333] ([Intel XE#2890]) -> [SKIP][334] ([Intel XE#1489]) +11 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][335] ([Intel XE#2890]) -> [SKIP][336] ([Intel XE#2234] / [Intel XE#2850]) +21 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          [SKIP][337] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][338] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_psr@fbc-psr-dpms.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2890]) -> [SKIP][340] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_psr@psr2-basic.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][341] ([Intel XE#2890]) -> [SKIP][342] ([Intel XE#2414])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#2329]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][345] ([Intel XE#2423]) -> [SKIP][346] ([Intel XE#2413]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][347] ([Intel XE#2423]) -> [SKIP][348] ([Intel XE#2426])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][349] ([Intel XE#2423]) -> [SKIP][350] ([Intel XE#2450])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][351] ([Intel XE#2423]) -> [SKIP][352] ([Intel XE#1499])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][353] ([Intel XE#1130]) -> [SKIP][354] ([Intel XE#2905]) +16 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@discovery-race:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1130]) -> [SKIP][356] ([Intel XE#2905])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_eudebug@discovery-race.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@xe_eudebug@discovery-race.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [SKIP][357] ([Intel XE#1130]) -> [FAIL][358] ([Intel XE#2364])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][359] ([Intel XE#1130]) -> [TIMEOUT][360] ([Intel XE#1473] / [Intel XE#2472])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][361] ([Intel XE#1130]) -> [SKIP][362] ([Intel XE#2322]) +11 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [SKIP][363] ([Intel XE#1130]) -> [FAIL][364] ([Intel XE#3160]) +2 other tests fail
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1130]) -> [SKIP][366] ([Intel XE#288])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][367] ([Intel XE#2961] / [Intel XE#3191]) -> [INCOMPLETE][368] ([Intel XE#1195]) +1 other test incomplete
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][369] ([Intel XE#1130]) -> [SKIP][370] ([Intel XE#586])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_mmap@small-bar.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][371] ([Intel XE#1130]) -> [SKIP][372] ([Intel XE#1420])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][373] ([Intel XE#1130]) -> [SKIP][374] ([Intel XE#2236])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#1130]) -> [SKIP][376] ([Intel XE#979])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][377] ([Intel XE#1130]) -> [SKIP][378] ([Intel XE#2284]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][379] ([Intel XE#1130]) -> [SKIP][380] ([Intel XE#944]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3209]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3209
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3255
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3296]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3296
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
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
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8088 -> IGTPW_12004
  * Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -> xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4

  IGTPW_12004: 3666f941651d40fb50532138899dbd09f78d0d82 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0
  xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4: afdb5631acb317eca18b171006efb3930fef7eb4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/index.html

--===============7917828510775787484==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Add some page flips before test start (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140721/">https://patchwork.freedesktop.org/series/140721/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8088_full -&gt; XEIGTPW_12004_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12004_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12004_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12004_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12004_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_psr@psr2-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_psr@psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3209">Intel XE#3209</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-external-import-coh:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@xe_pat@prime-external-import-coh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3296">Intel XE#3296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@core_hotunplug@hotrebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> +128 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105">Intel XE#3105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_color@ctm-0-25@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3255">Intel XE#3255</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-1/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-7/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@xe_compute_preempt@compute-preempt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_compute_preempt@compute-preempt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">PASS</a> +271 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_exec_compute_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_exec_compute_mode@once-basic.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-1/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@xe_tlb@basic-tlb.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-6/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-lnl-6/igt@xe_tlb@basic-tlb.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-433/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_eudebug@discovery-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-434/igt@xe_eudebug@discovery-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-436/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12004/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8088 -&gt; IGTPW_12004</li>
<li>Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -&gt; xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4</li>
</ul>
<p>IGTPW_12004: 3666f941651d40fb50532138899dbd09f78d0d82 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0<br />
  xe-2146-afdb5631acb317eca18b171006efb3930fef7eb4: afdb5631acb317eca18b171006efb3930fef7eb4</p>

</body>
</html>

--===============7917828510775787484==--
