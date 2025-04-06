Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11B2C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 21:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90A310E044;
	Sun,  6 Apr 2025 21:37:19 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7350910E044;
 Sun,  6 Apr 2025 21:37:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1554708343427654894=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/igt=5Ffb=3A_simulate_i?=
 =?utf-8?q?915_linear_fb_behavior_on_xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 21:37:18 -0000
Message-ID: <174397543843.41430.16008649289872254397@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
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

--===============1554708343427654894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: simulate i915 linear fb behavior on xe (rev3)
URL   : https://patchwork.freedesktop.org/series/146882/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8293_FULL -> XEIGTPW_12888_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12888_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12888_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12888_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [PASS][1] -> ([FAIL][2], [PASS][3]) +3 other tests ( 1 fail, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-bmg:          [PASS][4] -> ([PASS][5], [INCOMPLETE][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          [PASS][7] -> ([PASS][8], [INCOMPLETE][9])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          [PASS][10] -> ([PASS][11], [WARN][12])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12888_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][13] -> ([FAIL][14], [PASS][15]) ([Intel XE#911]) +2 other tests ( 1 fail, 1 pass )
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#4543]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#3908]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#619])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#610])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#787]) +25 other tests ( 2 skip )
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#2887]) +1 other test ( 2 skip )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +42 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +219 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][35] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#2724])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_cdclk@plane-scaling.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#306])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#373])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
    - shard-dg2-set2:     NOTRUN -> ([FAIL][44], [FAIL][45]) ([Intel XE#1178])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][48] -> ([SKIP][49], [PASS][50]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#309])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#323])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#4173]) +4 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][56] -> ([PASS][57], [SKIP][58]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4494])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-bmg:          [PASS][60] -> ([PASS][61], [INCOMPLETE][62]) ([Intel XE#2594])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4356])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][64] -> ([PASS][65], [FAIL][66]) ([Intel XE#4164])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [PASS][67] -> ([SKIP][68], [PASS][69]) ([Intel XE#702])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@kms_feature_discovery@display-2x.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [PASS][70] -> ([SKIP][71], [SKIP][72]) ([Intel XE#2316])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-8/igt@kms_flip@2x-busy-flip.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_flip@2x-busy-flip.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][73], [FAIL][74]) ([Intel XE#3321]) +4 other tests ( 1 fail, 1 pass )
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#301]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][76] -> ([PASS][77], [FAIL][78]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][79] -> ([FAIL][80], [FAIL][81]) ([Intel XE#301]) +3 other tests ( 2 fail )
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#1421])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@kms_flip@2x-flip-vs-modeset.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][84] -> ([FAIL][85], [PASS][86]) ([Intel XE#2882]) +3 other tests ( 1 fail, 1 pass )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [PASS][87] -> ([PASS][88], [SKIP][89]) ([Intel XE#2316]) +5 other tests ( 1 pass, 1 skip )
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][90] -> ([SKIP][91], [PASS][92]) ([Intel XE#310]) +5 other tests ( 1 pass, 1 skip )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][93] -> [FAIL][94] ([Intel XE#2882]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][95] -> ([FAIL][96], [PASS][97]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][98] -> [FAIL][99] ([Intel XE#301] / [Intel XE#3321])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][100] -> [DMESG-WARN][101] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][102] -> ([FAIL][103], [PASS][104]) ([Intel XE#886]) +4 other tests ( 1 fail, 1 pass )
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#1401] / [Intel XE#1745])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#1401])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
    - shard-lnl:          [PASS][109] -> ([FAIL][110], [PASS][111]) ([Intel XE#3106]) +1 other test ( 1 fail, 1 pass )
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#455]) +1 other test ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#651])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#656])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#4141])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#656]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [PASS][120] -> ([SKIP][121], [SKIP][122]) ([Intel XE#656])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][123] -> ([SKIP][124], [PASS][125]) ([Intel XE#656]) +2 other tests ( 1 pass, 1 skip )
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#651]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][127], [SKIP][128]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#658])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#653]) +6 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#656])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][132], [SKIP][133]) ([Intel XE#653]) +3 other tests ( 2 skip )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][134] -> ([SKIP][135], [PASS][136]) ([Intel XE#1503]) +1 other test ( 1 pass, 1 skip )
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-8/igt@kms_hdr@static-swap.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_hdr@static-swap.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][137] -> ([PASS][138], [SKIP][139]) ([Intel XE#4328])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][140] ([Intel XE#616])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [PASS][141] -> ([SKIP][142], [PASS][143]) ([Intel XE#4596])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-none.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          [PASS][144] -> ([PASS][145], [FAIL][146]) ([Intel XE#4658]) +3 other tests ( 1 fail, 1 pass )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-4/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-7/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-1/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][147] ([Intel XE#4212])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> ([SKIP][148], [SKIP][149]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][150] -> ([FAIL][151], [PASS][152]) ([Intel XE#718])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#3309])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1129])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][156], [SKIP][157]) ([Intel XE#2893])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1489]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#1122])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][161], [SKIP][162]) ([Intel XE#2850] / [Intel XE#929])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_psr@psr-cursor-render.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][164], [SKIP][165]) ([Intel XE#1127])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#1127])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#455]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][168] -> ([FAIL][169], [PASS][170]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1126])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#4497])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_eu_stall@non-blocking-read.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#4497])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#2905]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][177], [PASS][178]) ([Intel XE#1392])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#1392]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([Intel XE#1392])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-dg2-set2:     [PASS][182] -> ([SKIP][183], [SKIP][184]) ([Intel XE#1392])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][185] -> [SKIP][186] ([Intel XE#1392])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][187] -> ([SKIP][188], [PASS][189]) ([Intel XE#1392]) +6 other tests ( 1 pass, 1 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#288]) +1 other test ( 2 skip )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@xe_exec_fault_mode@many-rebind-imm.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_fault_mode@many-rebind-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#288]) +8 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2360])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#2541] / [Intel XE#3573])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_oa@invalid-oa-exponent.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][197], [FAIL][198]) ([Intel XE#1173])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#2284] / [Intel XE#366])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][200] -> [ABORT][201] ([Intel XE#1794]) +1 other test abort
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][202] -> ([PASS][203], [ABORT][204]) ([Intel XE#1794]) +1 other test ( 1 abort, 1 pass )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#944])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#4351])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][207] ([Intel XE#4543]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2191]) -> ([PASS][210], [PASS][211])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][212] ([Intel XE#3862]) -> ([PASS][213], [PASS][214]) +1 other test ( 2 pass )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][217] ([Intel XE#2291]) -> ([PASS][218], [PASS][219]) +1 other test ( 2 pass )
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#309]) -> ([PASS][221], [PASS][222])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#309]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#3009]) -> ([PASS][226], [PASS][227])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_dp_aux_dev.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_dp_aux_dev.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#4354]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#310]) -> ([PASS][231], [PASS][232])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#310]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [FAIL][235] ([Intel XE#2882]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_flip@blocking-wf_vblank.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][237] ([Intel XE#886]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][239] ([Intel XE#301]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#656]) -> [PASS][242] +1 other test pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#656]) -> ([PASS][244], [PASS][245]) +1 other test ( 2 pass )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1392]) -> [PASS][247] +3 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1392]) -> ([PASS][249], [PASS][250]) +4 other tests ( 2 pass )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
    - shard-lnl:          [FAIL][251] -> ([PASS][252], [PASS][253])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-7/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-adlp:         [DMESG-WARN][254] ([Intel XE#4173]) -> [PASS][255] +4 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [INCOMPLETE][256] -> ([PASS][257], [PASS][258])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@xe_module_load@many-reload.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@xe_module_load@many-reload.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][259] ([Intel XE#1794]) -> ([PASS][260], [PASS][261])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2191]) -> ([SKIP][263], [PASS][264]) ([Intel XE#2191])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][265] ([Intel XE#2314] / [Intel XE#2894]) -> ([SKIP][266], [PASS][267]) ([Intel XE#2314] / [Intel XE#2894])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][269], [SKIP][270]) ([Intel XE#787]) +1 other test ( 2 skip )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][272] ([Intel XE#787]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#787]) -> [SKIP][274] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#787]) -> ([SKIP][276], [SKIP][277]) ([Intel XE#455] / [Intel XE#787]) +2 other tests ( 2 skip )
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][278] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][279] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][280] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> ([DMESG-WARN][281], [PASS][282]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#1178]) -> ([FAIL][284], [SKIP][285]) ([Intel XE#1178] / [Intel XE#455])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][286] ([Intel XE#2341]) -> ([FAIL][287], [SKIP][288]) ([Intel XE#1178] / [Intel XE#2341])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#309]) -> ([SKIP][290], [PASS][291]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][292] ([Intel XE#2291]) -> ([PASS][293], [SKIP][294]) ([Intel XE#2291]) +3 other tests ( 1 pass, 1 skip )
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][295] ([Intel XE#4354]) -> ([SKIP][296], [PASS][297]) ([Intel XE#4354])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][298] ([Intel XE#2316]) -> ([SKIP][299], [PASS][300]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][301] ([Intel XE#2316]) -> ([FAIL][302], [FAIL][303]) ([Intel XE#3321])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#310]) -> ([FAIL][305], [SKIP][306]) ([Intel XE#301] / [Intel XE#310])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][307] ([Intel XE#3321]) -> ([FAIL][308], [PASS][309]) ([Intel XE#3321])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#310]) -> ([SKIP][311], [PASS][312]) ([Intel XE#310]) +1 other test ( 1 pass, 1 skip )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][313] ([Intel XE#886]) -> ([FAIL][314], [PASS][315]) ([Intel XE#3149] / [Intel XE#886])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][316] ([Intel XE#886]) -> ([FAIL][317], [PASS][318]) ([Intel XE#886])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][319] ([Intel XE#301]) -> ([FAIL][320], [PASS][321]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][322] ([Intel XE#301] / [Intel XE#3149]) -> ([FAIL][323], [PASS][324]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][325] ([Intel XE#4543]) -> [DMESG-FAIL][326] ([Intel XE#324] / [Intel XE#4543]) +7 other tests dmesg-fail
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#656]) -> ([SKIP][328], [SKIP][329]) ([Intel XE#651]) +1 other test ( 2 skip )
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][330] ([Intel XE#2311]) -> [SKIP][331] ([Intel XE#2312])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#656]) -> ([SKIP][333], [PASS][334]) ([Intel XE#656]) +1 other test ( 1 pass, 1 skip )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][335] ([Intel XE#4141]) -> [SKIP][336] ([Intel XE#2312])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][337] ([Intel XE#4141]) -> ([SKIP][338], [SKIP][339]) ([Intel XE#2312] / [Intel XE#4141]) +5 other tests ( 2 skip )
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][340] ([Intel XE#4141]) -> ([SKIP][341], [SKIP][342]) ([Intel XE#2312])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][343] ([Intel XE#2312]) -> ([SKIP][344], [SKIP][345]) ([Intel XE#2312] / [Intel XE#4141]) +2 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][346] ([Intel XE#2312]) -> ([SKIP][347], [SKIP][348]) ([Intel XE#2311] / [Intel XE#2312]) +11 other tests ( 2 skip )
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#651]) -> [SKIP][350] ([Intel XE#656]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][351] ([Intel XE#2312]) -> ([SKIP][352], [SKIP][353]) ([Intel XE#2311]) +1 other test ( 2 skip )
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][354] ([Intel XE#2311]) -> ([SKIP][355], [SKIP][356]) ([Intel XE#2311] / [Intel XE#2312]) +17 other tests ( 2 skip )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#656]) -> ([SKIP][358], [SKIP][359]) ([Intel XE#651] / [Intel XE#656]) +3 other tests ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][360] ([Intel XE#2312]) -> [SKIP][361] ([Intel XE#2311])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#656]) -> [SKIP][363] ([Intel XE#651]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#651]) -> ([SKIP][365], [SKIP][366]) ([Intel XE#651] / [Intel XE#656]) +10 other tests ( 2 skip )
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#656]) -> ([SKIP][368], [SKIP][369]) ([Intel XE#653] / [Intel XE#656]) +7 other tests ( 2 skip )
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][370] ([Intel XE#2313]) -> ([SKIP][371], [SKIP][372]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][373] ([Intel XE#2313]) -> ([SKIP][374], [SKIP][375]) ([Intel XE#2312])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#656]) -> ([SKIP][377], [SKIP][378]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][379] ([Intel XE#2312]) -> ([SKIP][380], [SKIP][381]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][382] ([Intel XE#2312]) -> ([SKIP][383], [SKIP][384]) ([Intel XE#2313]) +1 other test ( 2 skip )
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#653]) -> ([SKIP][386], [SKIP][387]) ([Intel XE#653] / [Intel XE#656]) +12 other tests ( 2 skip )
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#656]) -> [SKIP][389] ([Intel XE#653]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][390] ([Intel XE#2705] / [Intel XE#4540]) -> [ABORT][391] ([Intel XE#4540])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][392] ([Intel XE#4502] / [Intel XE#4540]) -> [ABORT][393] ([Intel XE#4540])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][394] ([Intel XE#1435]) -> ([PASS][395], [SKIP][396]) ([Intel XE#1435])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#362]) -> [FAIL][398] ([Intel XE#1729])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][399] ([Intel XE#771]) -> ([FAIL][400], [FAIL][401]) ([Intel XE#771] / [Intel XE#899]) +2 other tests ( 2 fail )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][402] ([Intel XE#771]) -> ([PASS][403], [FAIL][404]) ([Intel XE#771])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][405] ([Intel XE#4541]) -> ([PASS][406], [FAIL][407]) ([Intel XE#4541])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-lnl-2/igt@xe_oa@buffer-size.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-4/igt@xe_oa@buffer-size.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-6/igt@xe_oa@buffer-size.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#1061]) -> ([FAIL][409], [FAIL][410]) ([Intel XE#1173])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8293/shard-dg2-432/igt@xe_peer2peer@read.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_peer2peer@read.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_peer2peer@read.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8293 -> IGTPW_12888
  * Linux: xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda -> xe-2881-bddac84ead9a05c92f47845e6ef4f3f64ca53444

  IGTPW_12888: 12888
  IGT_8293: 645ffeb9647c6ec1f83725c8293e32fb3706875f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811d8f3f249392c5ceda
  xe-2881-bddac84ead9a05c92f47845e6ef4f3f64ca53444: bddac84ead9a05c92f47845e6ef4f3f64ca53444

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/index.html

--===============1554708343427654894==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: simulate i915 linear fb behavior=
 on xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146882/">https://patchwork.freedesktop.org/series/146882/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12888/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12888/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8293_FULL -&gt; XEIGTPW_12888_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12888_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12888_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
888_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xt=
ile-upscaling.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xt=
ile-to-64bpp-xtile-upscaling.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip_scaled_crc@flip=
-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a>) +3 other tests ( 1 fa=
il, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
888/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg=
-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">INCOMPLETE</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
88/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2=
/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-pl=
ane-0.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12888/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping@pi=
pe-a-plane-0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12888/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@p=
ipe-a-plane-0.html">WARN</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12888_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12888/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12888/shard-adlp-8/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
19">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotati=
on-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@bad-rotation-9=
0-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-til=
ed-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12888/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-r=
c-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +42 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +219 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_cdclk@plane-scaling.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/s=
hard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for=
-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12888/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-storm-disabl=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_content_protection@lic-type-0@=
pipe-a-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12888/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12888/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888=
/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Int=
el XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12888/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
9">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
888/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_cursor_leg=
acy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/sha=
rd-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_dit=
her@fb-8bpc-vs-panel-8bpc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-=
5/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@kms_fbcon_fbt@psr-sus=
pend.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4164">Intel XE#4164</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@kms_feature_discovery@display-2x.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/s=
hard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt=
@kms_feature_discovery@display-2x.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-8/igt@kms_flip@2x-busy-flip.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/ig=
t@kms_flip@2x-busy-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_flip@2x-busy-flip.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
4 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdm=
i-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12888/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdm=
i-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12888/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +3 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@kms_flip@2x-flip-vs-modeset.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
88/shard-lnl-3/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888=
/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">In=
tel XE#2882</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/s=
hard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@k=
ms_flip@2x-modeset-vs-vblank-race.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other te=
sts ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888=
/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/i=
gt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1288=
8/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE=
#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1288=
8/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/i=
gt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 o=
ther tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
88/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/s=
hard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interrupti=
ble@a-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12888/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interrupti=
ble@a-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/886">Intel XE#886</a>) +4 other tests ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_flip_scaled_c=
rc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"=
>Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-5/i=
gt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-=
a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-upscaling@pipe-a-default-mode.html">PASS</a> -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-7/igt@kms_flip_scal=
ed_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/=
shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscali=
ng@pipe-a-default-mode.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) +1 other test ( 1 fail=
, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip_scaled_cr=
c@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1288=
8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464=
/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-cur-indfb-onoff.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-8/igt@kms_hdr@static-swap.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@=
kms_hdr@static-swap.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_hdr@static-swap.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/=
shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt=
@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-=
a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-none.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/=
shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt=
@kms_plane_multiple@2x-tiling-none.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-4/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2888/shard-lnl-7/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-l=
nl-1/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658">Intel XE#4658=
</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-lnl-1/igt@kms_plane_scaling@planes-upscal=
e-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_plane_scaling=
@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12888/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#=
3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overla=
y-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-mo=
ve-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
888/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_psr@psr-cursor-render.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
88/shard-dg2-464/igt@kms_psr@psr-cursor-render.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Inte=
l XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
888/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg=
-7/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>=
) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_eu_stall@non-blocking-read=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12888/shard-dg2-433/igt@xe_eu_stall@non-blocking-read.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#=
4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@xe_eu_stall@unprivileged-acces=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_eudebug_online@interrupt-ot=
her-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@xe_exec_bas=
ic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel =
XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12888/shard-lnl-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1288=
8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432=
/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12888/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2888/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@xe_exec_fault_mode@many-rebin=
d-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12888/shard-dg2-432/igt@xe_exec_fault_mode@many-rebind-imm.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">=
Intel XE#288</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@xe_exec_fault_mode@once-userpt=
r-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_oa@invalid-oa-exponent.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
88/shard-dg2-432/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Int=
el XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_oa@non-sampling-read-error.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-v=
ram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-v=
ram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-9/igt=
@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-1/=
igt@xe_pm@s4-multiple-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-2/igt@xe_pm@s4-multiple-execs.h=
tml">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1794">Intel XE#1794</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@xe_query@multigpu-query-config=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_sriov_scheduling@equal-thro=
ughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-8/igt@kms_big_f=
b@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_bw@connected-linear-=
tiling-2-displays-2560x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_bw@connected-linea=
r-tiling-2-displays-2560x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3862">Intel XE#3862</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12888/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
ccs.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/sha=
rd-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12888/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-lega=
cy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12888/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PA=
SS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12888/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-to=
ggle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12888/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard=
-dg2-435/igt@kms_dp_aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_dp_aux_dev.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12888/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-blocking-abso=
lute-wf_vblank-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@2x-blocking-a=
bsolute-wf_vblank-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recre=
ate-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE=
#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12888/shard-dg2-433/igt@kms_flip@blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"=
>Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12888/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi=
-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer=
_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@km=
s_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a=
>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +3 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@xe_exec_basic@multigpu=
-no-exec-userptr-invalidate-race.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_exec_basic@mult=
igpu-no-exec-userptr-invalidate-race.html">PASS</a>) +4 other tests ( 2 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.h=
tml">FAIL</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12888/shard-lnl-7/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2888/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">P=
ASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-=
xe_device_probe_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adlp-1/igt@xe_fa=
ult_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS<=
/a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@xe_module_load@many-reload.html">INCOMPLETE</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/s=
hard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-432/igt@xe_modu=
le_load@many-reload.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#17=
94</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2888/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-3/igt@xe_pm@=
s4-d3hot-basic-exec.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_bw@connected-linear-=
tiling-2-displays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_bw@connected-linea=
r-tiling-2-displays-1920x1080p.html">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#28=
94</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi=
-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_ccs@bad-aux-=
stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_ccs@bad-aux-=
stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other tes=
t ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_ccs=
@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_ccs@crc-prim=
ary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/sh=
ard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pi=
pe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Int=
el XE#4522</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12888/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12888/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-=
cc.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12888/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/s=
hard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12888/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-b=
mg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel X=
E#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_cursor_legacy@2x-=
nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_cursor_leg=
acy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 =
other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_cursor_leg=
acy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/229=
1">Intel XE#2291</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12888/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-b=
mg-2/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
88/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_flip@=
2x-flip-vs-dpms.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ad-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank=
@ad-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12888/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptib=
le.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12888/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb-interruptible.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
888/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-6/igt@kms_f=
lip@blocking-wf_vblank.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Inte=
l XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12888/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@a-edp1.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-l=
nl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888=
/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12888/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
>PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-adl=
p-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other test=
s dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking=
@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-mult=
idraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
c-2p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_frontbuffer_tracking@f=
bc-2p-pri-indfb-multidraw.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 1 pas=
s, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontb=
uffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)=
 +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +17 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-43=
5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/651">Intel XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-i=
ndfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-433/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">=
Intel XE#656</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">In=
tel XE#656</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-435/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-7/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313=
">Intel XE#2313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-6/igt@kms_frontbuffer_t=
racking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg-1/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-464/igt@kms_frontbuffer=
_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@km=
s_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@kms_frontbuffer_t=
racking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705=
">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4540">Intel XE#4540</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_plane_scaling@intel-ma=
x-src-size.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4502">Intel XE#4502</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-466/igt@kms_plane_=
scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12888/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-bmg=
-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12888/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12888/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-l=
nl-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12888/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@=
pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12888/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-=
a-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/771">Intel XE#771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-lnl-2/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shar=
d-lnl-4/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12888/shard-lnl-6/igt@xe_oa@buffer-size.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8293/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12888/sh=
ard-dg2-463/igt@xe_peer2peer@read.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12888/shard-dg2-463/igt@xe_peer2peer@read=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8293 -&gt; IGTPW_12888</li>
<li>Linux: xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda -&gt; xe-2881-b=
ddac84ead9a05c92f47845e6ef4f3f64ca53444</li>
</ul>
<p>IGTPW_12888: 12888<br />
  IGT_8293: 645ffeb9647c6ec1f83725c8293e32fb3706875f @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811=
d8f3f249392c5ceda<br />
  xe-2881-bddac84ead9a05c92f47845e6ef4f3f64ca53444: bddac84ead9a05c92f47845=
e6ef4f3f64ca53444</p>

</body>
</html>

--===============1554708343427654894==--
