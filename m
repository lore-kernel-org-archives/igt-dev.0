Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCF3CCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 06:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52E610E9DE;
	Fri, 24 Oct 2025 06:43:18 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808BA10E9DE;
 Fri, 24 Oct 2025 06:43:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6982209546663022041=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_intel=5Fgpu=5Ftop=3A_Usabi?=
 =?utf-8?q?lity_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 Oct 2025 06:43:17 -0000
Message-ID: <176128819751.49991.14273165748391589073@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
In-Reply-To: <cover.1761225010.git.sebastian.brzezinka@intel.com>
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

--===============6982209546663022041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel_gpu_top: Usability improvements
URL   : https://patchwork.freedesktop.org/series/156425/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8596_FULL -> XEIGTPW_13934_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Known issues
------------

  Here are the changes found in XEIGTPW_13934_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2233])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2370])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#316]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +4 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#607])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2191]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#2191])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +55 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2907]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#3862]) +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#3432])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][23] ([Intel XE#3113] / [Intel XE#4345])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][24] ([Intel XE#6168])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][25] ([Intel XE#1727] / [Intel XE#3113])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2724]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#306]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2341])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#308])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1424]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#309]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#4354])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2244]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4422])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#4422])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4422])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401] / [Intel XE#1745])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1401])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#6312]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6312])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2311]) +17 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#651]) +17 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6313])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#5390]) +8 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#653]) +17 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2313]) +16 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#656]) +16 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1158])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1470] / [Intel XE#2853])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#346])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#346]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2925])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4298])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2927])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#3428]) +8 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#5624])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#5624])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#5624])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4596])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2763]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#870])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#718])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2499])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1439] / [Intel XE#3141])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1406] / [Intel XE#2893]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1406]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-2/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [PASS][88] -> [SKIP][89] ([Intel XE#1406] / [Intel XE#4692])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#3414]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1127])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2330])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1435])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#330])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2168])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2168]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1499])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@kms_vrr@lobf.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#6360]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_copy_basic@mem-matrix-copy-2x2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#5300])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@xe_copy_basic@mem-matrix-copy-2x2.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1126]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#4837]) +6 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#4837]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4837]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#688]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2322]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#288]) +12 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][111] ([Intel XE#6299])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:
    - shard-lnl:          NOTRUN -> [WARN][112] ([Intel XE#5786])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@xe_exec_system_allocator@madvise-split-vma-with-mapping.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#5007])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#5007])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][115] ([Intel XE#3428])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#4943]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4943]) +14 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#4915]) +181 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][119] ([Intel XE#5466] / [Intel XE#5530])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          NOTRUN -> [ABORT][120] ([Intel XE#4757])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][121] ([Intel XE#3099]) +2 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#3573]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#5742])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#5742])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2284])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2284] / [Intel XE#366])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2284] / [Intel XE#366])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#584])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#6406])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pmu@gt-c6-idle:
    - shard-dg2-set2:     [PASS][131] -> [FAIL][132] ([Intel XE#6366])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-466/igt@xe_pmu@gt-c6-idle.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@xe_pmu@gt-c6-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#4733]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4733]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#944])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#944])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#944]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4814])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#6318])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@xe_sriov_vram@vf-access-after-resize-up.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#6376])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][141] ([Intel XE#6054]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][143] ([Intel XE#5993]) -> [PASS][144] +3 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][147] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][149] ([Intel XE#6168] / [i915#14968]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][151] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][153] ([Intel XE#5354]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [DMESG-WARN][155] -> [PASS][156] +3 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][157] ([Intel XE#718]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][159] ([i915#15106]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][161] ([Intel XE#4459]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_module_load@unload:
    - shard-bmg:          [ABORT][163] -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_load@unload.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@xe_module_load@unload.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [DMESG-WARN][165] ([Intel XE#3428] / [Intel XE#4504]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [INCOMPLETE][167] -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [FAIL][169] ([Intel XE#6406]) -> [PASS][170] +2 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-lnl-3/igt@xe_pm@s4-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [FAIL][171] ([Intel XE#6406]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_pm@s4-mocs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_pm@s4-mocs.html

  * igt@xe_render_copy@render-full:
    - shard-bmg:          [DMESG-WARN][173] ([Intel XE#3428]) -> [PASS][174] +6 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_render_copy@render-full.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@xe_render_copy@render-full.html

  * igt@xe_vm@bind-execqueues-independent:
    - shard-dg2-set2:     [INCOMPLETE][175] ([Intel XE#2594]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-434/igt@xe_vm@bind-execqueues-independent.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@xe_vm@bind-execqueues-independent.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][177] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][178] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][180] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][181] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][182] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#455]) -> [FAIL][184] ([Intel XE#1178])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-dg2-432/igt@kms_content_protection@legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#2311]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#2313]) -> [SKIP][188] ([Intel XE#2312]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [DMESG-FAIL][189] ([Intel XE#5681]) -> [DMESG-WARN][190] ([Intel XE#3428] / [Intel XE#5681])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][191] ([Intel XE#2426]) -> [FAIL][192] ([Intel XE#1729])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][193], [PASS][194], [PASS][195], [PASS][196], [SKIP][197], [PASS][198], [PASS][199], [DMESG-WARN][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [SKIP][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244]) ([Intel XE#2457])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-2/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-3/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-4/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-5/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-8/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-2/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6299
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
  [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6366
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6406
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106


Build changes
-------------

  * IGT: IGT_8596 -> IGTPW_13934
  * Linux: xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4 -> xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff

  IGTPW_13934: aa69671168fe3cab94c6edee8fedcc3dfb90e445 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8596: 8596
  xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4: e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4
  xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff: c63ccee28ae7ab4cb57a2433314f08c71da914ff

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/index.html

--===============6982209546663022041==
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
<tr><td><b>Series:</b></td><td>intel_gpu_top: Usability improvements</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156425/">https://patchwork.freedesktop.org/series/156425/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13934/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13934/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8596_FULL -&gt; XEIGTPW_13934_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13934_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_bw@connected-linear-tiling=
-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_bw@linear-tiling-2-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13934/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel =
XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_chamelium_color@ctm-limite=
d-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-t=
imings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_content_protection@legacy@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_cursor_crc@cursor-offscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13934/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-=
1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p=
-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6313">Intel XE#6313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_joiner@basic-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-436/igt@kms_joiner@basic-force-ultra-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13934/shard-bmg-6/igt@kms_lease@lease-invalid-crtc@pipe-d-hdmi-a-3.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3428">Intel XE#3428</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5624">Intel XE#5624</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb888=
8-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5624">Intel XE#5624</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-2/igt@kms_psr@pr-sprite-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13934/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-for=
mat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@kms_tv_load_detect@load-detect=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel X=
E#2168</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@xe_compute_preempt@compute-pre=
empt-many-vram-evict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6360">Intel XE#6360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-matrix-copy-2x2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@xe_copy_basic@mem-matrix-copy-=
2x2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@xe_eudebug@basic-exec-queues.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-exten=
ded-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_eudebug_online@single-step-on=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-st=
andalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@xe_exec_fault_mode@many-execqu=
eues-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@xe_exec_reset@long-spin-comp-r=
euse-many-preempt-threads.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6299">Intel XE#6299</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@xe_exec_system_allocator@madvise=
-split-vma-with-mapping.html">WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@xe_exec_system_allocator@many-64=
k-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_exec_system_allocator@many-64=
k-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_exec_system_allocator@many-la=
rge-mmap-new-race-nomemset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@xe_exec_system_allocator@once-mm=
ap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-large-malloc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +181 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-5/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4757">Intel XE#4757</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-466/igt@xe_oa@whitelisted-registers-us=
erspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-433/igt@xe_pm@d3hot-i2c.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Inte=
l XE#5742</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_pm@d3hot-i2c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel =
XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-4/igt@xe_pm@s3-vm-bind-userptr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584=
">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3=
/igt@xe_pm@s4-vm-bind-prefetch.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6406">Intel XE#6406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-c6-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-466/igt@xe_pmu@gt-c6-idle.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt=
@xe_pmu@gt-c6-idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6366">Intel XE#6366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-3/igt@xe_pxp@display-pxp-fb.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">=
Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@xe_pxp@pxp-termination-key-upd=
ate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-1/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-436/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-432/igt@xe_render_copy@render-stress-1=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-dg2-435/igt@xe_sriov_vram@vf-access-after-=
resize-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6318">Intel XE#6318</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13934/shard-lnl-7/igt@xe_sriov_vram@vf-access-after-re=
size-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6376">Intel XE#6376</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-3/igt@kms_as=
ync_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-lnl-8/igt@kms_async_fli=
ps@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> +3 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/sha=
rd-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6168">Intel XE#6168</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14968">i915#14968</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-434/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transiti=
ons-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@kms_cursor_=
legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html">DMESG-W=
ARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
934/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html">PASS</a> +3 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-=
lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i9=
15#15106</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13934/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_139=
34/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-7/igt@xe_module_load@unload.html">ABORT</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/ig=
t@xe_module_load@unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE=
#3428</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4504">Intel XE#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shar=
d-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-lnl-3/igt@xe_pm@s4-basic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6406">Intel XE#6406</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-ln=
l-8/igt@xe_pm@s4-basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@xe_pm@s4-mocs.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6406">Intel XE#6406</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg=
-5/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@xe_render_copy@render-full.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel=
 XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13934/shard-bmg-7/igt@xe_render_copy@render-full.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-434/igt@xe_vm@bind-execqueues-independent.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
94">Intel XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13934/shard-dg2-432/igt@xe_vm@bind-execqueues-independent.html=
">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard=
-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard=
-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/311=
3">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-dg2-432/igt@kms_content_protection@legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13934/shard-dg2-433/igt@kms_content_protection@legacy.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1=
178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681">Intel =
XE#5681</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13934/shard-bmg-6/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE=
#3428</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5681">Intel XE#5681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8596/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13934/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8596/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8596/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8596/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
596/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8596/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8596/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8596/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8596/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8596/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8596/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#=
2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
428">Intel XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13934/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13934/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13934/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13934/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13934/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13934/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13934/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
934/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13934/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13934/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel =
XE#2457</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8596 -&gt; IGTPW_13934</li>
<li>Linux: xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4 -&gt; xe-3974-c=
63ccee28ae7ab4cb57a2433314f08c71da914ff</li>
</ul>
<p>IGTPW_13934: aa69671168fe3cab94c6edee8fedcc3dfb90e445 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8596: 8596<br />
  xe-3973-e5409e1beaa3a7a89c5b5d90fd3a616ecacb1df4: e5409e1beaa3a7a89c5b5d9=
0fd3a616ecacb1df4<br />
  xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff: c63ccee28ae7ab4cb57a243=
3314f08c71da914ff</p>

</body>
</html>

--===============6982209546663022041==--
