Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED950E77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 18:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE8810E64F;
	Thu, 12 Dec 2024 18:49:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E0B10E64C;
 Thu, 12 Dec 2024 18:49:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8823185561643330273=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_scripts/generate=5Figa64?=
 =?utf-8?q?=5Fcodes=3A_fix_path_of_iga64=5Fmacros=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 18:49:19 -0000
Message-ID: <173402935984.1677800.17320766180568489589@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212-fix_iga64_macros_path-v1-1-9e8d149c8667@intel.com>
In-Reply-To: <20241212-fix_iga64_macros_path-v1-1-9e8d149c8667@intel.com>
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

--===============8823185561643330273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/generate_iga64_codes: fix path of iga64_macros.h
URL   : https://patchwork.freedesktop.org/series/142480/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8150_full -> XEIGTPW_12306_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12306_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12306_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12306_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12306_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#911]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][9] ([Intel XE#3781]) +2 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2328])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2191])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][20] -> [DMESG-WARN][21] ([Intel XE#2705]) +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#306])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#3278])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1727]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2321])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2291]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2286])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#2141]) +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [PASS][36] -> [DMESG-FAIL][37] ([Intel XE#2705])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#776])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2374])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1421]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#3321]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [PASS][43] -> [ABORT][44] ([Intel XE#3468]) +1 other test abort
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2316]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#886]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293] / [Intel XE#2380])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2293])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1401] / [Intel XE#1745])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#651])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +12 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#2333]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2313])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2312]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2934])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-bmg:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2763]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2763]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#718])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2499])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][69] -> [INCOMPLETE][70] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_pm_rpm@cursor.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2864])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
    - shard-bmg:          [PASS][73] -> [DMESG-WARN][74] ([Intel XE#1727] / [Intel XE#3468]) +11 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][75] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1489]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2414])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_sequence@queue-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][79] ([Intel XE#3468]) +1 other test dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_sequence@queue-busy@pipe-a-dp-2.html

  * igt@kms_sequence@queue-busy@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][80] ([Intel XE#3468]) +13 other tests dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_sequence@queue-busy@pipe-c-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][81] -> [FAIL][82] ([Intel XE#899])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [PASS][83] -> [DMESG-FAIL][84] ([Intel XE#3468]) +15 other tests dmesg-fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1499])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#756])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2905]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2905]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#688]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_balancer@many-parallel-basic:
    - shard-bmg:          [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1727]) +5 other tests dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_exec_balancer@many-parallel-basic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_exec_balancer@many-parallel-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1392]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-6/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2322])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][94] -> [DMESG-WARN][95] ([Intel XE#3468]) +87 other tests dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][96] -> [DMESG-WARN][97] ([Intel XE#3467] / [Intel XE#3468]) +2 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#3343] / [Intel XE#3468]) +1 other test dmesg-warn
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2427])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2284] / [Intel XE#366])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [PASS][102] -> [DMESG-WARN][103] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#958])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#944])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#944])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][108] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][110] ([Intel XE#2291]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][112] ([Intel XE#877]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][114] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][115] +2 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][116] ([Intel XE#3321]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][118] ([Intel XE#2316]) -> [PASS][119] +2 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][120] ([Intel XE#886]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [INCOMPLETE][122] ([Intel XE#2635]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-bmg:          [DMESG-WARN][124] ([Intel XE#1727]) -> [PASS][125] +2 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][126] ([Intel XE#1430]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@psr2-sprite-blt@edp-1:
    - shard-lnl:          [FAIL][128] -> [PASS][129] +3 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-5/igt@kms_psr@psr2-sprite-blt@edp-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@kms_psr@psr2-sprite-blt@edp-1.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          [DMESG-FAIL][130] ([Intel XE#3468]) -> [PASS][131] +5 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][132] ([Intel XE#2159]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue:
    - shard-bmg:          [DMESG-WARN][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#3467]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][140], [PASS][141], [PASS][142], [SKIP][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165]) ([Intel XE#2457]) -> ([PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][189] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [DMESG-WARN][191] ([Intel XE#3468]) -> [PASS][192] +56 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][193] ([Intel XE#1178]) -> [INCOMPLETE][194] ([Intel XE#2715] / [Intel XE#3468]) +3 other tests incomplete
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_content_protection@atomic.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [DMESG-WARN][195] -> [SKIP][196] ([Intel XE#2291])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][197] ([Intel XE#877]) -> [DMESG-WARN][198] ([Intel XE#3468])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][199] ([Intel XE#2291]) -> [DMESG-WARN][200] ([Intel XE#3468]) +2 other tests dmesg-warn
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][201] ([Intel XE#2955] / [Intel XE#3468]) -> [DMESG-WARN][202] ([Intel XE#3468])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [FAIL][203] ([Intel XE#2333]) -> [DMESG-FAIL][204] ([Intel XE#3468]) +10 other tests dmesg-fail
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][205] ([Intel XE#2312]) -> [FAIL][206] ([Intel XE#2333]) +5 other tests fail
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][207] ([Intel XE#2333]) -> [SKIP][208] ([Intel XE#2312]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [DMESG-FAIL][210] ([Intel XE#3468])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][211] ([Intel XE#3468]) -> [FAIL][212] ([Intel XE#2333]) +7 other tests fail
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#2311]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][215] ([Intel XE#2311]) -> [SKIP][216] ([Intel XE#2312]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][217] ([Intel XE#2313]) -> [SKIP][218] ([Intel XE#2312]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#2312]) -> [SKIP][220] ([Intel XE#2313]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [INCOMPLETE][221] ([Intel XE#2864]) -> [DMESG-WARN][222] ([Intel XE#1727] / [Intel XE#3468])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-bmg:          [INCOMPLETE][223] -> [DMESG-WARN][224] ([Intel XE#1727] / [Intel XE#3468])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [INCOMPLETE][225] ([Intel XE#1473]) -> [TIMEOUT][226] ([Intel XE#1473])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][227] ([Intel XE#1473]) -> [FAIL][228] ([Intel XE#1000])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][229] ([Intel XE#1473]) -> [TIMEOUT][230] ([Intel XE#1473] / [Intel XE#2472])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][231] ([Intel XE#3343]) -> [DMESG-WARN][232] ([Intel XE#3343] / [Intel XE#3468])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][233] ([Intel XE#3467]) -> [DMESG-WARN][234] ([Intel XE#3468])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [DMESG-WARN][235] ([Intel XE#3467]) -> [DMESG-WARN][236] ([Intel XE#3467] / [Intel XE#3468])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][237] ([Intel XE#2833]) -> [SKIP][238] ([Intel XE#1192] / [Intel XE#3026])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][239] ([Intel XE#3625]) -> [DMESG-WARN][240] ([Intel XE#3467])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@many-reload.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_module_load@many-reload.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [DMESG-WARN][241] ([Intel XE#3468]) -> [DMESG-FAIL][242] ([Intel XE#1727] / [Intel XE#3468])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][243] ([Intel XE#2919] / [Intel XE#3468]) -> [DMESG-WARN][244] ([Intel XE#2919])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_wedged@basic-wedged.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][245] ([Intel XE#1130]) -> [ABORT][246] ([Intel XE#3765])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3765
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * IGT: IGT_8150 -> IGTPW_12306
  * Linux: xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 -> xe-2362-7b441ab54824526dd570dfbfbef51bcd2ba4c5b5

  IGTPW_12306: 12306
  IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292: b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292
  xe-2362-7b441ab54824526dd570dfbfbef51bcd2ba4c5b5: 7b441ab54824526dd570dfbfbef51bcd2ba4c5b5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/index.html

--===============8823185561643330273==
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
<tr><td><b>Series:</b></td><td>scripts/generate_iga64_codes: fix path of ig=
a64_macros.h</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142480/">https://patchwork.freedesktop.org/series/142480/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12306/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12306/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8150_full -&gt; XEIGTPW_12306_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12306_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12306_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
306_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12306/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128.html=
">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0=
-system-vram01.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_ccs@suspend-resume@xmajor-comp=
ressed-compfmt0-system-vram01.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12306/shard-bmg-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userpt=
r.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12306_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12306/shard-lnl-1/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_async_flips@crc-atomic@pipe-=
a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3781">Intel XE#3781</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12306/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@=
pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other=
 test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
25">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x64.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/=
shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x64.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12306/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-=
dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12306/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@kms_flip@2x-dpms-vs-vblank-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg=
-4/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other t=
est abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/sh=
ard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/s=
hard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-pixel-formats@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_plane_scaling@pla=
ne-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@k=
ms_pm_rpm@cursor.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other =
tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/=
shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel =
XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms=
@plane-68.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_sequence@queue-busy@pipe-a-d=
p-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_sequence@queue-busy@pipe-c-d=
p-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12306/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7=
/igt@kms_vblank@wait-busy-hang.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +15 other=
 tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-pa=
rallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@xe_exec_balancer@many-parallel-basic.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/=
shard-bmg-5/igt@xe_exec_balancer@many-parallel-basic.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-6/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bind=
execqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe=
_engine_class_render0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-w=
ritesip-nodebug@drm_xe_engine_class_render0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +87 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-w=
ait_for_lmem_ready.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_fault_injection@inject-fau=
lt-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_ct_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_fault_injection@inject-fault-pr=
obe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>=
) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/i=
gt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-ln=
l-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-lnl-5/igt@xe_query@multigpu-query-invalid-=
query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_cursor_lega=
cy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-f=
lipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_flip@=
2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +2 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12306/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Int=
el XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12306/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2635">Intel XE#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interr=
uptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-modifiers.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_plane_sc=
aling@plane-scaler-with-clipping-clamping-modifiers.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shar=
d-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-5/igt@kms_psr@psr2-sprite-blt@edp-1.html">FAIL</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-l=
nl-4/igt@kms_psr@psr2-sprite-blt@edp-1.html">PASS</a> +3 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12306/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.ht=
ml">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#215=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
06/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-bindexecque=
ue.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12306/shard-bmg-3/igt@xe_exec_compute_mode@many-execqueues-bi=
ndexecqueue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_execute.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_fault_injection=
@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_fault_inje=
ction@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
150/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8150/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
06/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12306/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12306/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12306/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12306/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12306/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Int=
el XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12306/shard-lnl-8/igt@xe_pm@s4-basic-exec.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-time=
out.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@xe_sysfs_preempt_timeout=
@preempt_timeout_us-timeout.html">PASS</a> +56 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_content_protection@atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12306/shard-bmg-2/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel =
XE#2715</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12306/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2955">Intel XE#2955</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmf=
b-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shr=
fb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1=
0 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-7/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12306/shard-bmg-6/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864"=
>Intel XE#2864</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-59:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">=
INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12306/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12306/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-la=
rge.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">I=
ntel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12306/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">I=
ntel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">=
Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12306/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
73">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_log_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@xe_fault_inje=
ction@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#=
3343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops=
_prepare.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-2/igt@xe_fault_injection@=
vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops=
_run.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_fault_injection@vm-b=
ind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1230=
6/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026">Intel XE=
#3026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@xe_module_load@many-reload.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625">Intel XE#36=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
306/shard-bmg-7/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#346=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12306/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#=
2919</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12306/shard-bmg-8/igt@xe_wedged@basic-wedged.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">=
Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12306/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3765">Intel X=
E#3765</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8150 -&gt; IGTPW_12306</li>
<li>Linux: xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 -&gt; xe-2362-7=
b441ab54824526dd570dfbfbef51bcd2ba4c5b5</li>
</ul>
<p>IGTPW_12306: 12306<br />
  IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292: b34d1ff04eaa0ed48ef25f1=
d758d2a55f7c3c292<br />
  xe-2362-7b441ab54824526dd570dfbfbef51bcd2ba4c5b5: 7b441ab54824526dd570dfb=
fbef51bcd2ba4c5b5</p>

</body>
</html>

--===============8823185561643330273==--
