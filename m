Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C6CD65552
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 20:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3370E10E9C2;
	Tue, 26 Nov 2024 20:15:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C05B10E9C2;
 Tue, 26 Nov 2024 20:15:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1500178158410043338=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Ignore_more_warns_in_xe=5F?=
 =?utf-8?q?wedged_tests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 20:15:14 -0000
Message-ID: <173265211407.3476890.68964213058177592@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
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

--===============1500178158410043338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Ignore more warns in xe_wedged tests (rev5)
URL   : https://patchwork.freedesktop.org/series/140511/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8126_full -> XEIGTPW_12202_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12202_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12202_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12202_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-rmfb@c-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip@flip-vs-rmfb@c-hdmi-a3.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [SKIP][4] ([Intel XE#2136]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-dg2-set2:     [SKIP][6] ([Intel XE#1130]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_eudebug_online@pagefault-write.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][8] ([Intel XE#3468]) -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12202_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][10] -> [FAIL][11] ([Intel XE#3440])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@core_getversion@all-cards.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#1885]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@core_hotunplug@hotreplug.html
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#1885])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_hotunplug@hotreplug.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#3249])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][18] -> [SKIP][19] ([Intel XE#3453])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2134]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@fbdev@info.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2134]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@fbdev@read.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@fbdev@read.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2423]) +12 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#1701]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2327]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +76 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#3468]) +38 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#314]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#306])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2325])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - shard-bmg:          [PASS][41] -> [DMESG-FAIL][42] ([Intel XE#3468]) +7 other tests dmesg-fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x128.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x128.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][43] ([Intel XE#3468]) +3 other tests dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][44] -> [INCOMPLETE][45] ([Intel XE#3468])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][46] ([Intel XE#3468])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#2423] / [i915#2575]) +99 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1340]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([i915#3804])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#301]) +4 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#2882])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][58] -> [FAIL][59] ([Intel XE#301])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3486])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#886]) +4 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2293]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][65] ([Intel XE#1727] / [Intel XE#3468])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2136]) +16 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#455]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2136]) +21 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#2136]) +28 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#2333])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2313]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_getfb@getfb-handle-zero:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2423] / [i915#2575]) +21 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_getfb@getfb-handle-zero.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2423]) +87 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#361])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-bmg:          [PASS][81] -> [DMESG-WARN][82] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2763]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2763] / [Intel XE#455])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2763]) +11 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#1430])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2446]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][90] -> [DMESG-WARN][91] ([Intel XE#3468]) +3 other tests dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2446]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
    - shard-bmg:          [PASS][94] -> [DMESG-WARN][95] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1489]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2136]) +16 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#2883]) +2 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][103] ([Intel XE#3468]) +1 other test dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][104] ([Intel XE#1727] / [Intel XE#3468])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#2423])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@testdisplay.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@testdisplay.html

  * igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:
    - shard-bmg:          [PASS][107] -> [DMESG-WARN][108] ([Intel XE#1727]) +2 other tests dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2905]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][110] ([Intel XE#1473])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1130]) +28 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][112] -> [SKIP][113] ([Intel XE#1130]) +205 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2322])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1130]) +14 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][116] -> [DMESG-WARN][117] ([Intel XE#3467]) +1 other test dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3343])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [PASS][120] -> [SKIP][121] ([Intel XE#1192])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#1192])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#378])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_oa@non-zero-reason@ccs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][125] ([Intel XE#3468]) +21 other tests dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_oa@non-zero-reason@ccs-0.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#944])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#1130]) +212 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1885]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][131] ([Intel XE#3339]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][133] ([Intel XE#2134]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@fbdev@eof.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@fbdev@eof.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#2134]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@fbdev@write.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [SKIP][137] ([Intel XE#2423]) -> [PASS][138] +99 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][139] ([Intel XE#1426]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-WARN][141] ([Intel XE#3468]) -> [PASS][142] +34 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][143] ([Intel XE#2136]) -> [PASS][144] +25 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][145] ([Intel XE#829]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#829]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][149] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [SKIP][153] -> [PASS][154] +7 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_cdclk@mode-transition.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_cdclk@mode-transition.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2423] / [i915#2575]) -> [PASS][156] +67 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2423]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_dp_aux_dev.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][159] ([Intel XE#2958]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][161] ([Intel XE#3189]) -> [PASS][162] +5 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [DMESG-WARN][163] -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-FAIL][165] ([Intel XE#3468]) -> [PASS][166] +8 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][167] ([Intel XE#886]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#301]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@a-dp4:
    - shard-dg2-set2:     [DMESG-WARN][171] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-dp4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-dp4.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#3468]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][175] ([Intel XE#2597]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a6:
    - shard-dg2-set2:     [DMESG-FAIL][177] ([Intel XE#3468]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
    - shard-dg2-set2:     [DMESG-FAIL][179] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][180] +4 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][181] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][184] +8 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2136]) -> [PASS][186] +23 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][187] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-bmg:          [DMESG-WARN][189] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_pm_dc@dc9-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][191] ([Intel XE#2029]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2446]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][195] ([Intel XE#2446]) -> [PASS][196] +2 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_rpm@i2c.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_pm_rpm@i2c.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [DMESG-WARN][197] ([Intel XE#1727]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_sysfs_edid_timing.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][199] ([Intel XE#899]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@query-busy-hang:
    - shard-bmg:          [INCOMPLETE][201] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_vblank@query-busy-hang.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_vblank@query-busy-hang.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [FAIL][203] ([Intel XE#1522]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-5/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-lnl:          [FAIL][205] ([Intel XE#3512]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-bmg:          [DMESG-WARN][207] ([Intel XE#1727]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_evict@evict-beng-small-external-cm.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][209] ([Intel XE#1130]) -> [PASS][210] +203 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1130]) -> [PASS][212] +137 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [DMESG-FAIL][213] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1192]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [SKIP][217] ([Intel XE#2229]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          [FAIL][219] ([Intel XE#2249]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@rcs-0.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][221] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_pm@s4-mocs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_pm@s4-mocs.html

  * igt@xe_tlb@basic-tlb:
    - shard-lnl:          [CRASH][225] ([Intel XE#3212]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@xe_tlb@basic-tlb.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-1/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [DMESG-WARN][227] ([Intel XE#2919] / [Intel XE#3119]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-8/igt@xe_wedged@basic-wedged.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-7/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][229] ([Intel XE#1885]) -> [DMESG-WARN][230] ([Intel XE#3468])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [DMESG-WARN][231] ([Intel XE#3468]) -> [SKIP][232] ([Intel XE#1885])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_hotunplug@unplug-rescan.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2423] / [i915#2575]) -> [SKIP][234] ([Intel XE#623])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][235] ([Intel XE#873]) -> [SKIP][236] ([Intel XE#2423])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][237] ([Intel XE#2385]) -> [SKIP][238] ([Intel XE#2423])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][239] ([Intel XE#2370]) -> [SKIP][240] ([Intel XE#2423])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][241] ([Intel XE#3468]) -> [DMESG-FAIL][242] ([Intel XE#3468])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#316]) -> [SKIP][244] ([Intel XE#2136] / [Intel XE#2351])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][245] ([Intel XE#2136]) -> [SKIP][246] ([Intel XE#2327]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][247] ([Intel XE#3468]) -> [SKIP][248] ([Intel XE#2136]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#316]) -> [SKIP][250] ([Intel XE#2136]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][251] ([Intel XE#3468]) -> [SKIP][252] ([Intel XE#2136])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [INCOMPLETE][253] ([Intel XE#1727] / [Intel XE#3225] / [Intel XE#402]) -> [SKIP][254] ([Intel XE#2136])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][255] ([Intel XE#2327]) -> [SKIP][256] ([Intel XE#2136]) +5 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2136]) -> [SKIP][258] ([Intel XE#316]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][260] ([Intel XE#316])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#829]) -> [SKIP][262] ([Intel XE#2136] / [Intel XE#2351])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][263] ([Intel XE#2136]) -> [DMESG-FAIL][264] ([Intel XE#3468])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][265] ([Intel XE#829]) -> [SKIP][266] ([Intel XE#2136]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][267] ([Intel XE#1124]) -> [SKIP][268] ([Intel XE#2136]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#619]) -> [SKIP][270] ([Intel XE#2136] / [Intel XE#2351])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#610]) -> [SKIP][272] ([Intel XE#2136]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          [SKIP][273] ([Intel XE#2136]) -> [SKIP][274] ([Intel XE#610])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][275] ([Intel XE#2136]) -> [SKIP][276] ([Intel XE#1124]) +12 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][277] ([Intel XE#829]) -> [SKIP][278] ([Intel XE#1124])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1124]) -> [SKIP][280] ([Intel XE#2136]) +10 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][282] ([Intel XE#619])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#607]) -> [SKIP][284] ([Intel XE#2136])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][286] ([Intel XE#1124]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2136]) -> [SKIP][288] ([Intel XE#1124]) +5 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [SKIP][290] ([Intel XE#367]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][291] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][292] ([Intel XE#2423]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#2191])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-bmg:          [SKIP][295] ([Intel XE#2423]) -> [SKIP][296] ([Intel XE#2314] / [Intel XE#2894])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][297] ([Intel XE#3189]) -> [SKIP][298] ([Intel XE#2314] / [Intel XE#2894])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2191]) -> [SKIP][300] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#367]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][303] ([Intel XE#2423]) -> [SKIP][304] ([Intel XE#367]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][305] ([Intel XE#367]) -> [SKIP][306] ([Intel XE#2423])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][307] -> [SKIP][308] ([Intel XE#2136]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136]) -> [SKIP][310] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          [SKIP][311] ([Intel XE#2136]) -> [SKIP][312] ([Intel XE#2887]) +20 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][314] ([Intel XE#455] / [Intel XE#787])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2907]) -> [SKIP][316] ([Intel XE#2136]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#2907]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#829]) -> [SKIP][320] ([Intel XE#2136]) +5 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
    - shard-bmg:          [SKIP][321] ([Intel XE#3282]) -> [SKIP][322] ([Intel XE#2887])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#3442]) -> [SKIP][324] ([Intel XE#2136])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][325] ([Intel XE#3432]) -> [SKIP][326] ([Intel XE#2136]) +2 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][327] ([Intel XE#2136]) -> [SKIP][328] ([Intel XE#3432]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][332] ([Intel XE#2136]) +10 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][334] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][335] ([Intel XE#2887]) -> [SKIP][336] ([Intel XE#2136]) +18 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][337] ([Intel XE#3189]) -> [SKIP][338] ([Intel XE#2724])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cdclk@mode-transition.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][339] ([Intel XE#2724]) -> [SKIP][340] ([Intel XE#2136]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#314]) -> [SKIP][342] ([Intel XE#2136] / [Intel XE#2351])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#2325])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#306]) -> [SKIP][346] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2423] / [i915#2575]) -> [SKIP][348] ([Intel XE#306])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][349] ([Intel XE#2325]) -> [SKIP][350] ([Intel XE#2423])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_chamelium_color@gamma.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#373]) -> [SKIP][352] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][353] ([Intel XE#2423]) -> [SKIP][354] ([Intel XE#2252]) +12 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][355] ([Intel XE#2252]) -> [SKIP][356] ([Intel XE#2423]) +10 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2423] / [i915#2575]) -> [SKIP][358] ([Intel XE#373]) +6 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][359] ([Intel XE#2390]) -> [SKIP][360] ([Intel XE#2423]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#307]) -> [SKIP][362] ([Intel XE#2423] / [i915#2575])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [INCOMPLETE][363] ([Intel XE#2715] / [Intel XE#3468]) -> [SKIP][364] ([Intel XE#2423])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_content_protection@legacy.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][365] ([Intel XE#1178]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_content_protection@srm.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_content_protection@srm.html
    - shard-bmg:          [FAIL][367] ([Intel XE#1178]) -> [SKIP][368] ([Intel XE#2423])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_content_protection@srm.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][369] ([Intel XE#2341]) -> [SKIP][370] ([Intel XE#2423])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_content_protection@type1.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][371] ([Intel XE#1188]) -> [SKIP][372] ([Intel XE#2423] / [i915#2575])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_content_protection@uevent.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][373] ([Intel XE#2423]) -> [SKIP][374] ([Intel XE#2320]) +7 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][375] ([Intel XE#2320]) -> [SKIP][376] ([Intel XE#2423]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#308]) -> [SKIP][378] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][379] ([Intel XE#2423]) -> [SKIP][380] ([Intel XE#2321]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][381] ([Intel XE#3189]) -> [SKIP][382] ([Intel XE#2320])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][383] ([Intel XE#2321]) -> [SKIP][384] ([Intel XE#2423]) +2 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2423] / [i915#2575]) -> [SKIP][386] ([Intel XE#455]) +7 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x128:
    - shard-bmg:          [DMESG-FAIL][387] ([Intel XE#3468]) -> [SKIP][388] ([Intel XE#2423])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-128x128.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-128x128.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][389] ([Intel XE#2423]) -> [SKIP][390] ([Intel XE#2291])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#323]) -> [SKIP][392] ([Intel XE#2423] / [i915#2575])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-bmg:          [SKIP][393] ([Intel XE#2286]) -> [SKIP][394] ([Intel XE#2423])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][395] ([Intel XE#2291]) -> [DMESG-WARN][396] ([Intel XE#877])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][397] ([Intel XE#2423]) -> [DMESG-WARN][398] ([Intel XE#877])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][399] ([Intel XE#2291]) -> [SKIP][400] ([Intel XE#2423]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][401] ([Intel XE#3189]) -> [SKIP][402] ([Intel XE#2423]) +6 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][403] ([Intel XE#2423]) -> [SKIP][404] ([Intel XE#2286])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][405] ([Intel XE#3070]) -> [SKIP][406] ([Intel XE#2136])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2351]) -> [SKIP][408] ([Intel XE#455])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_dsc@dsc-basic.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][409] ([Intel XE#3189]) -> [SKIP][410] ([Intel XE#2244])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136]) -> [SKIP][412] ([Intel XE#455]) +4 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][414] ([Intel XE#455]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#2244])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][417] ([Intel XE#2244]) -> [SKIP][418] ([Intel XE#2136]) +2 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][419] ([Intel XE#2136]) -> [FAIL][420] ([Intel XE#1695])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][421] ([Intel XE#2423]) -> [SKIP][422] ([Intel XE#2373])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#703]) -> [SKIP][424] ([Intel XE#2423] / [i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][425] ([Intel XE#2423]) -> [SKIP][426] ([Intel XE#1138])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2423] / [i915#2575]) -> [SKIP][428] ([Intel XE#1137])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          [SKIP][429] ([Intel XE#2423]) -> [SKIP][430] ([Intel XE#2375])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1135]) -> [SKIP][432] ([Intel XE#2423] / [i915#2575])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][433] ([Intel XE#2882]) -> [SKIP][434] ([Intel XE#2316])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2423] / [i915#2575]) -> [FAIL][436] ([Intel XE#301])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][437] ([Intel XE#3189]) -> [SKIP][438] ([Intel XE#2316])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][439] ([Intel XE#2423]) -> [SKIP][440] ([Intel XE#2316]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][441] ([Intel XE#2316]) -> [SKIP][442] ([Intel XE#2423]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [DMESG-WARN][443] -> [SKIP][444] ([Intel XE#2423])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-bmg:          [SKIP][445] ([Intel XE#2423]) -> [DMESG-WARN][446] ([Intel XE#3468]) +2 other tests dmesg-warn
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@flip-vs-rmfb.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][447] ([Intel XE#2597]) -> [SKIP][448] ([Intel XE#2423])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-bmg:          [INCOMPLETE][449] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][450] ([Intel XE#2136])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][451] ([Intel XE#2136]) -> [SKIP][452] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#455]) -> [SKIP][454] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][455] ([Intel XE#3189]) -> [SKIP][456] ([Intel XE#2293] / [Intel XE#2380])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-bmg:          [SKIP][457] ([Intel XE#2136]) -> [INCOMPLETE][458] ([Intel XE#1727] / [Intel XE#3468])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][459] ([Intel XE#2380]) -> [SKIP][460] ([Intel XE#2136])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-bmg:          [SKIP][461] ([Intel XE#3189]) -> [SKIP][462] ([Intel XE#2136]) +6 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][463] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][464] ([Intel XE#2136]) +6 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#455]) -> [SKIP][466] ([Intel XE#2136]) +3 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-bmg:          [SKIP][467] ([Intel XE#540]) -> [SKIP][468] ([Intel XE#2423])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_force_connector_basic@force-connector-state.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_force_connector_basic@force-connector-state.html
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#540]) -> [SKIP][470] ([Intel XE#2423] / [i915#2575])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@force-connector-state.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][471] ([i915#5274]) -> [SKIP][472] ([Intel XE#2423] / [i915#2575])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#651]) -> [SKIP][474] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][475] ([Intel XE#2312]) -> [SKIP][476] ([Intel XE#2311]) +6 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][477] ([Intel XE#2136]) -> [SKIP][478] ([Intel XE#2311]) +32 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][479] ([Intel XE#2136]) -> [FAIL][480] ([Intel XE#2333]) +11 other tests fail
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [INCOMPLETE][481] ([Intel XE#1727]) -> [FAIL][482] ([Intel XE#2333])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][483] ([Intel XE#2333]) -> [SKIP][484] ([Intel XE#2136]) +16 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][485] ([Intel XE#3468]) -> [FAIL][486] ([Intel XE#2333]) +3 other tests fail
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][487] ([Intel XE#2333]) -> [SKIP][488] ([Intel XE#2312]) +2 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][489] ([Intel XE#2312]) -> [FAIL][490] ([Intel XE#2333])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][491] ([Intel XE#2136]) -> [SKIP][492] ([Intel XE#2312]) +8 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][493] ([Intel XE#2333]) -> [DMESG-FAIL][494] ([Intel XE#3468]) +6 other tests dmesg-fail
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#651]) -> [SKIP][496] ([Intel XE#2136]) +19 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][498] ([Intel XE#651]) +8 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][499] ([Intel XE#2312]) -> [SKIP][500] ([Intel XE#2136]) +4 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][501] ([Intel XE#2311]) -> [SKIP][502] ([Intel XE#2136]) +30 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][503] ([Intel XE#2311]) -> [SKIP][504] ([Intel XE#2312]) +5 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][505] ([Intel XE#3189]) -> [SKIP][506] ([Intel XE#2311]) +2 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][507] -> [SKIP][508] ([Intel XE#651]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#2136]) -> [SKIP][510] ([Intel XE#651]) +11 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#658]) -> [SKIP][512] ([Intel XE#2136] / [Intel XE#2351])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#2136]) -> [SKIP][514] ([Intel XE#653]) +24 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][515] -> [SKIP][516] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][517] ([Intel XE#2136]) -> [SKIP][518] ([Intel XE#2313]) +31 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][519] ([Intel XE#2313]) -> [SKIP][520] ([Intel XE#2312]) +7 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][521] ([Intel XE#3189]) -> [SKIP][522] ([Intel XE#2313]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][523] ([Intel XE#2352]) -> [SKIP][524] ([Intel XE#2136])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][525] ([Intel XE#2136]) -> [SKIP][526] ([Intel XE#2350])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#653]) -> [SKIP][528] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][529] ([Intel XE#2312]) -> [SKIP][530] ([Intel XE#2313]) +1 other test skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][531] ([Intel XE#2313]) -> [SKIP][532] ([Intel XE#2136]) +31 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][534] ([Intel XE#653]) +6 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#653]) -> [SKIP][536] ([Intel XE#2136]) +35 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-suspend.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-repeated-different-handles:
    - shard-bmg:          [SKIP][537] -> [SKIP][538] ([Intel XE#2423])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_getfb@getfb-repeated-different-handles.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_getfb@getfb-repeated-different-handles.html
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#687]) -> [SKIP][540] ([Intel XE#2423] / [i915#2575])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_getfb@getfb-repeated-different-handles.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_getfb@getfb-repeated-different-handles.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [FAIL][541] -> [SKIP][542] ([Intel XE#2423] / [i915#2575])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][543] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][544] ([Intel XE#2423])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][545] ([Intel XE#2136]) -> [SKIP][546] ([Intel XE#2934])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#2136]) -> [SKIP][548] ([Intel XE#2925])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#346]) -> [SKIP][550] ([Intel XE#2136])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][551] ([Intel XE#2934]) -> [SKIP][552] ([Intel XE#2136])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][553] ([Intel XE#2423]) -> [SKIP][554] ([Intel XE#2501])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#356]) -> [SKIP][556] ([Intel XE#2423] / [i915#2575])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][557] ([Intel XE#616]) -> [SKIP][558] ([Intel XE#2423] / [i915#2575])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][559] ([Intel XE#2423]) -> [SKIP][560] ([Intel XE#2393])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][561] ([Intel XE#2393]) -> [SKIP][562] ([Intel XE#2423])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#455]) -> [SKIP][564] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][565] ([Intel XE#2493]) -> [SKIP][566] ([Intel XE#2423]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#2423] / [i915#2575]) -> [FAIL][568] ([Intel XE#361])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][569] ([Intel XE#3189]) -> [SKIP][570] ([Intel XE#2763])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][571] ([Intel XE#2763]) -> [SKIP][572] ([Intel XE#2423]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [DMESG-WARN][573] ([Intel XE#1727]) -> [SKIP][574] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][576] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#2423] / [i915#2575]) -> [SKIP][578] ([Intel XE#2763] / [Intel XE#455])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
    - shard-bmg:          [SKIP][579] ([Intel XE#2423]) -> [SKIP][580] ([Intel XE#2763]) +1 other test skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#870]) -> [SKIP][582] ([Intel XE#2136]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2136]) -> [SKIP][584] ([Intel XE#2938])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][585] ([Intel XE#870]) -> [SKIP][586] ([Intel XE#2136])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_backlight@fade.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][587] ([Intel XE#2391]) -> [SKIP][588] ([Intel XE#2136])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1129]) -> [SKIP][590] ([Intel XE#2136])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
    - shard-bmg:          [SKIP][591] ([Intel XE#2136]) -> [SKIP][592] ([Intel XE#2392])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][593] ([Intel XE#3309]) -> [SKIP][594] ([Intel XE#2136])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][595] ([Intel XE#1430]) -> [SKIP][596] ([Intel XE#2136])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][597] ([Intel XE#2136]) -> [SKIP][598] ([Intel XE#2505])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][599] ([Intel XE#1439]) -> [SKIP][600] ([Intel XE#2446])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][601] -> [SKIP][602] ([Intel XE#2446])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][603] ([Intel XE#3189]) -> [SKIP][604] ([Intel XE#1489])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#2136]) -> [SKIP][606] ([Intel XE#1489]) +7 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][607] ([Intel XE#2136]) -> [SKIP][608] ([Intel XE#1489]) +10 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#1489]) -> [SKIP][610] ([Intel XE#2136]) +4 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][611] ([Intel XE#1489]) -> [SKIP][612] ([Intel XE#2136]) +10 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#1122]) -> [SKIP][614] ([Intel XE#2136]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
    - shard-bmg:          [SKIP][615] ([Intel XE#2387]) -> [SKIP][616] ([Intel XE#2136])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][617] ([Intel XE#2136]) -> [SKIP][618] ([Intel XE#2387])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][620] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][622] ([Intel XE#2136]) +12 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          [SKIP][623] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][624] ([Intel XE#2136]) +15 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr@fbc-psr-suspend.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][625] ([Intel XE#2136]) -> [SKIP][626] ([Intel XE#2234] / [Intel XE#2850]) +16 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][627] -> [SKIP][628] ([Intel XE#2136]) +8 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][630] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][632] ([Intel XE#2351])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#2136]) -> [SKIP][634] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][635] -> [SKIP][636] ([Intel XE#2850] / [Intel XE#929])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr@psr2-primary-blt.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html
    - shard-bmg:          [SKIP][637] ([Intel XE#3189]) -> [SKIP][638] ([Intel XE#2234] / [Intel XE#2850])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr@psr2-primary-blt.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][639] ([Intel XE#2414]) -> [SKIP][640] ([Intel XE#2136])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][641] ([Intel XE#3414]) -> [SKIP][642] ([Intel XE#2423]) +2 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#2423] / [i915#2575]) -> [SKIP][644] ([Intel XE#3414]) +2 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-bmg:          [SKIP][645] ([Intel XE#2423]) -> [SKIP][646] ([Intel XE#3414])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][647] ([Intel XE#2330]) -> [SKIP][648] ([Intel XE#2423])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][649] ([Intel XE#3189]) -> [SKIP][650] ([Intel XE#2413])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][651] ([Intel XE#2423]) -> [SKIP][652] ([Intel XE#2413]) +1 other test skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][653] ([Intel XE#1435]) -> [SKIP][654] ([Intel XE#2423])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][655] ([Intel XE#2426]) -> [SKIP][656] ([Intel XE#2423])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#1500]) -> [SKIP][658] ([Intel XE#2423] / [i915#2575])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][659] ([Intel XE#2423]) -> [SKIP][660] ([Intel XE#2450])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [INCOMPLETE][661] ([Intel XE#1034]) -> [DMESG-WARN][662] ([Intel XE#3468])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][664] ([Intel XE#1727] / [Intel XE#3468])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-bmg:          [SKIP][665] ([Intel XE#2423]) -> [DMESG-FAIL][666] ([Intel XE#3468])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][667] ([Intel XE#2423]) -> [SKIP][668] ([Intel XE#1499]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][669] -> [SKIP][670] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_vrr@flipline.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][671] ([Intel XE#2168]) -> [SKIP][672] ([Intel XE#2423])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_vrr@lobf.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#2423] / [i915#2575]) -> [SKIP][674] ([Intel XE#2168])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_vrr@lobf.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][675] ([Intel XE#1499]) -> [SKIP][676] ([Intel XE#2423]) +2 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][677] ([Intel XE#2423]) -> [SKIP][678] ([Intel XE#756]) +1 other test skip
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][679] ([Intel XE#756]) -> [SKIP][680] ([Intel XE#2423]) +1 other test skip
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_writeback@writeback-pixel-formats.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2-set2:     [SKIP][681] ([Intel XE#756]) -> [SKIP][682] ([Intel XE#2423] / [i915#2575])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][683] ([Intel XE#2423] / [i915#2575]) -> [SKIP][684] ([Intel XE#1091] / [Intel XE#2849])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-bmg:          [SKIP][685] ([Intel XE#2423]) -> [SKIP][686] ([Intel XE#1091] / [Intel XE#2849])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][688] ([Intel XE#1130])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#1126]) -> [SKIP][690] ([Intel XE#1130]) +1 other test skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][691] ([Intel XE#1130]) -> [SKIP][692] ([Intel XE#2504])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-client-th:
    - shard-dg2-set2:     [SKIP][693] ([Intel XE#1130]) -> [SKIP][694] ([Intel XE#2905]) +11 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_eudebug@basic-client-th.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#2905]) -> [SKIP][696] ([Intel XE#1130]) +15 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_eudebug@basic-vm-bind.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][697] ([Intel XE#1130]) -> [SKIP][698] ([Intel XE#2905]) +12 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          [SKIP][699] -> [SKIP][700] ([Intel XE#1130])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_eudebug_online@pagefault-write.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-bmg:          [SKIP][701] ([Intel XE#2905]) -> [SKIP][702] ([Intel XE#1130]) +12 other tests skip
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][703] ([Intel XE#1473]) -> [SKIP][704] ([Intel XE#1130])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][705] ([Intel XE#1130]) -> [TIMEOUT][706] ([Intel XE#1473])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - shard-bmg:          [SKIP][707] ([Intel XE#1130]) -> [DMESG-WARN][708] ([Intel XE#1727]) +2 other tests dmesg-warn
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [SKIP][709] ([Intel XE#1130]) -> [SKIP][710] ([Intel XE#2322]) +10 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][711] ([Intel XE#2322]) -> [SKIP][712] ([Intel XE#1130]) +12 other tests skip
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-dg2-set2:     [SKIP][713] ([Intel XE#288]) -> [SKIP][714] ([Intel XE#1130]) +34 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][715] ([Intel XE#1130]) -> [SKIP][716] ([Intel XE#288]) +22 other tests skip
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - shard-bmg:          [DMESG-WARN][717] ([Intel XE#3468]) -> [SKIP][718] ([Intel XE#1130]) +5 other tests skip
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][719] ([Intel XE#1130]) -> [SKIP][720] ([Intel XE#2360]) +1 other test skip
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [SKIP][721] ([Intel XE#1130]) -> [DMESG-WARN][722] ([Intel XE#3468]) +3 other tests dmesg-warn
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [SKIP][723] ([Intel XE#1130]) -> [DMESG-WARN][724] ([Intel XE#3343] / [Intel XE#3468])
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [SKIP][725] ([Intel XE#1130]) -> [DMESG-WARN][726] ([Intel XE#3467])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [DMESG-WARN][727] ([Intel XE#3343]) -> [SKIP][728] ([Intel XE#1130])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-FAIL][729] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][730] ([Intel XE#1130])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [SKIP][731] ([Intel XE#1130]) -> [FAIL][732] ([Intel XE#3499])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [FAIL][733] ([Intel XE#3499]) -> [SKIP][734] ([Intel XE#1130]) +1 other test skip
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-dg2-set2:     [SKIP][735] ([Intel XE#1130]) -> [DMESG-WARN][736] ([Intel XE#3467]) +1 other test dmesg-warn
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-dg2-set2:     [DMESG-WARN][737] ([Intel XE#3467]) -> [SKIP][738] ([Intel XE#1130]) +2 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][739] ([Intel XE#3467]) -> [DMESG-WARN][740] ([Intel XE#3467] / [Intel XE#3468])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][741] ([Intel XE#1130]) -> [SKIP][742] ([Intel XE#586])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_mmap@small-bar.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     [SKIP][743] ([Intel XE#1130]) -> [SKIP][744] ([Intel XE#512])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_mmap@small-bar.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][745] ([Intel XE#3546]) -> [DMESG-WARN][746] ([Intel XE#3467])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_module_load@many-reload.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][747] -> [DMESG-WARN][748] ([Intel XE#3467])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_module_load@reload-no-display.html
    - shard-dg2-set2:     [DMESG-FAIL][749] ([Intel XE#3467]) -> [FAIL][750] ([Intel XE#3546])
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][751] ([Intel XE#1130]) -> [SKIP][752] ([Intel XE#3573]) +6 other tests skip
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_oa@invalid-oa-format-id.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][753] ([Intel XE#2248]) -> [SKIP][754] ([Intel XE#1130])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][755] ([Intel XE#3573]) -> [SKIP][756] ([Intel XE#1130]) +8 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#1337]) -> [SKIP][758] ([Intel XE#1130])
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][759] ([Intel XE#1130]) -> [SKIP][760] ([Intel XE#1420])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][761] ([Intel XE#2236]) -> [SKIP][762] ([Intel XE#1130])
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     [SKIP][763] ([Intel XE#979]) -> [SKIP][764] ([Intel XE#1130])
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][765] ([Intel XE#1173]) -> [SKIP][766] ([Intel XE#1061])
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_peer2peer@read.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][767] ([Intel XE#2284]) -> [SKIP][768] ([Intel XE#1130])
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][769] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][770] ([Intel XE#1130]) +1 other test skip
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-WARN][771] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][772] ([Intel XE#1130]) +1 other test skip
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_pm@s4-basic.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [SKIP][773] ([Intel XE#1130]) -> [DMESG-WARN][774] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_pm@s4-exec-after.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][775] ([Intel XE#944]) -> [SKIP][776] ([Intel XE#1130]) +2 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_query@multigpu-query-cs-cycles.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][777] ([Intel XE#944]) -> [SKIP][778] ([Intel XE#1130]) +3 other tests skip
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][779] ([Intel XE#1130]) -> [SKIP][780] ([Intel XE#944]) +2 other tests skip
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][781] ([Intel XE#1130]) -> [SKIP][782] ([Intel XE#944]) +1 other test skip
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@xe_query@multigpu-query-topology.html

  * igt@xe_vm@large-binds-4194304:
    - shard-dg2-set2:     [DMESG-WARN][783] ([Intel XE#1727]) -> [SKIP][784] ([Intel XE#1130])
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_vm@large-binds-4194304.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_vm@large-binds-4194304.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][785] -> [SKIP][786] ([Intel XE#1130])
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][787] ([Intel XE#1130]) -> [ABORT][788] ([Intel XE#3075] / [Intel XE#3084])
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3189]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3282
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3512
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
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
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8126 -> IGTPW_12202
  * Linux: xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e -> xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198

  IGTPW_12202: 12202
  IGT_8126: 8126
  xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e: 7cd4d1589e461d61330ec272c448bc6d1b9da35e
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/index.html

--===============1500178158410043338==
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
<tr><td><b>Series:</b></td><td>Ignore more warns in xe_wedged tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140511/">https://patchwork.freedesktop.org/series/140511/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8126_full -&gt; XEIGTPW_12202_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12202_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12202_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12202_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip@flip-vs-rmfb@c-hdmi-a3.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_eudebug_online@pagefault-write.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12202_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +38 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x128.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_getfb@getfb-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_lease@possible-crtcs-filtering.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_lease@possible-crtcs-filtering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +205 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_oa@non-zero-reason@ccs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +212 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">PASS</a> +99 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +34 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_cdclk@mode-transition.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_cdclk@mode-transition.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +67 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dp_aux_dev.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_pm_dc@dc9-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_pm_dc@dc9-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_pm_rpm@i2c.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_sysfs_edid_timing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_vblank@query-busy-hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_vblank@query-busy-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-5/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3512">Intel XE#3512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_evict@evict-beng-small-external-cm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_evict@evict-beng-small-external-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +203 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +137 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_gt_freq@freq_suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@rcs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-1/igt@xe_tlb@basic-tlb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-8/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-lnl-7/igt@xe_wedged@basic-wedged.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3282">Intel XE#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-128x128.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-128x128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-repeated-different-handles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_plane_cursor@viewport.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr@psr2-primary-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_module_load@reload-no-display.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_pm@s4-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_pm@s4-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-3/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-4194304:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_vm@large-binds-4194304.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-466/igt@xe_vm@large-binds-4194304.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12202/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8126 -&gt; IGTPW_12202</li>
<li>Linux: xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e -&gt; xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198</li>
</ul>
<p>IGTPW_12202: 12202<br />
  IGT_8126: 8126<br />
  xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e: 7cd4d1589e461d61330ec272c448bc6d1b9da35e<br />
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198</p>

</body>
</html>

--===============1500178158410043338==--
