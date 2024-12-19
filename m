Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA03E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 15:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AE210E4A2;
	Thu, 19 Dec 2024 15:20:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80C10E361;
 Thu, 19 Dec 2024 15:20:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6991235152398967910=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Miscellaneous_OA_Refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 15:20:12 -0000
Message-ID: <173462161237.458061.1172977429120068105@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
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

--===============6991235152398967910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Miscellaneous OA Refactors
URL   : https://patchwork.freedesktop.org/series/142773/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8164_full -> XEIGTPW_12342_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12342_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12342_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12342_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-436/igt@kms_cursor_legacy@single-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-434/igt@kms_hdr@bpc-switch-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@kms_vblank@wait-forked-busy:
    - shard-dg2-set2:     [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-435/igt@kms_vblank@wait-forked-busy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_vblank@wait-forked-busy.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][11] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@xe_drm_fdinfo@utilization-others-full-load.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][13] ([Intel XE#2961] / [Intel XE#2998]) -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-435/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12342_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#3767]) +23 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2550]) +17 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][17] ([Intel XE#3781]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-2/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][18] ([Intel XE#3781]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3768])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2370])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2328])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#610])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#610])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +48 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +14 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3432])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1727] / [Intel XE#3113])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#2692]) +1 other test incomplete
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2724])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2325]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2252]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#373]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2341])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2390])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1178]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#1178]) +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2321]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2291]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#877])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2286])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#2141]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1138])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1135])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][60] -> [INCOMPLETE][61] ([Intel XE#2597])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][62] ([Intel XE#2597])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2316]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][65] ([Intel XE#2882])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#886]) +2 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][69] ([Intel XE#2049])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
    - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#2882]) +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#455]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#2333]) +13 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2312]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#651]) +12 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +22 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +22 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#653]) +12 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2927])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#3012])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][83] ([Intel XE#1035])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][84] -> [FAIL][85] ([Intel XE#361])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2763]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#870]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#870])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#3309])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1489]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1489]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2234])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#3414])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#3414])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#2159]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1499])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#756])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#756]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1126])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_drm_fdinfo@virtual-utilization-single-idle:
    - shard-bmg:          NOTRUN -> [FAIL][105] ([Intel XE#3869])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2905]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2905]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][108] -> [FAIL][109] ([Intel XE#1600]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][110] ([Intel XE#1473] / [Intel XE#402])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][111] ([Intel XE#1473]) +1 other test timeout
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [TIMEOUT][112] ([Intel XE#1473] / [Intel XE#2472])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2322]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#288]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2248]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2838] / [Intel XE#979])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2427])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2284])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][120] -> [ABORT][121] ([Intel XE#1358] / [Intel XE#1607])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-4/igt@xe_pm@s4-basic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][122] ([Intel XE#3088])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#944]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#944])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-dg2-set2:     [INCOMPLETE][125] -> [PASS][126] +2 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][127] ([Intel XE#3719]) -> [PASS][128] +3 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][129] -> [PASS][130] +3 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][131] ([Intel XE#2291]) -> [PASS][132] +2 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][133] ([Intel XE#2425]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][135] ([Intel XE#3070]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][137] ([Intel XE#2316]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#301]) -> [PASS][140] +10 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][141] ([Intel XE#2597]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][143] ([Intel XE#886]) -> [PASS][144] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][145] ([Intel XE#2882]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][147] ([Intel XE#3321]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#3321]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [FAIL][151] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
    - shard-bmg:          [FAIL][153] -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-bmg:          [INCOMPLETE][155] ([Intel XE#1035]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][157] ([Intel XE#361]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][159] ([Intel XE#718]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][161] ([Intel XE#1430]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][163] ([Intel XE#1435]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][165] ([Intel XE#899]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [INCOMPLETE][167] ([Intel XE#3864]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [INCOMPLETE][169] ([Intel XE#1616]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-436/igt@xe_ccs@suspend-resume.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@xe_ccs@suspend-resume.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][171] ([Intel XE#1473]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][173] -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [INCOMPLETE][175] ([Intel XE#3865]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [SKIP][177] ([Intel XE#1192]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [SKIP][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204]) ([Intel XE#2457]) -> ([PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-5/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][228] ([Intel XE#2341]) -> [FAIL][229] ([Intel XE#1178])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_content_protection@legacy.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][230] ([Intel XE#2316]) -> [FAIL][231] ([Intel XE#2882])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][232] ([Intel XE#2311]) -> [SKIP][233] ([Intel XE#2312]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][234] ([Intel XE#2312]) -> [SKIP][235] ([Intel XE#2311]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][236] ([Intel XE#2333]) -> [SKIP][237] ([Intel XE#2312]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][238] ([Intel XE#2312]) -> [FAIL][239] ([Intel XE#2333]) +4 other tests fail
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][240] ([Intel XE#2312]) -> [SKIP][241] ([Intel XE#2313]) +9 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][242] ([Intel XE#2313]) -> [SKIP][243] ([Intel XE#2312]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#362]) -> [FAIL][245] ([Intel XE#1729])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][246] ([Intel XE#1473]) -> [INCOMPLETE][247] ([Intel XE#1473])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [DMESG-FAIL][248] -> [FAIL][249] ([Intel XE#1000])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][250] ([Intel XE#1473]) -> [FAIL][251] ([Intel XE#1000])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_evict@evict-threads-large.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@xe_evict@evict-threads-large.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][252] ([Intel XE#3765]) -> [ABORT][253] ([Intel XE#3421])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3765
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#3864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864
  [Intel XE#3865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3865
  [Intel XE#3869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3869
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8164 -> IGTPW_12342
  * Linux: xe-2396-e9a5d74b7f60fe6f7d55ebe636ff871214b6caec -> xe-2397-d8f0c44e2ed948dcc45d04a0dfa83612995a702b

  IGTPW_12342: d6f2757dca13107ae4337520c30c846df6a3216d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8164: e9d9934c7c6dc6878792d82424fc928e7f6996cb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2396-e9a5d74b7f60fe6f7d55ebe636ff871214b6caec: e9a5d74b7f60fe6f7d55ebe636ff871214b6caec
  xe-2397-d8f0c44e2ed948dcc45d04a0dfa83612995a702b: d8f0c44e2ed948dcc45d04a0dfa83612995a702b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/index.html

--===============6991235152398967910==
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
<tr><td><b>Series:</b></td><td>Miscellaneous OA Refactors</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142773/">https://patchwork.freedesktop.org/series/142773/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12342/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12342/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8164_full -&gt; XEIGTPW_12342_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12342_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12342_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
342_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-436/igt@kms_cursor_legacy@single-move.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard=
-dg2-434/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> +2 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2=
-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12342/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptib=
le@ac-dp2-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-434/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-4=
34/igt@kms_hdr@bpc-switch-dpms.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-=
a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12342/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-h=
dmi-a-3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-435/igt@kms_vblank@wait-forked-busy.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-d=
g2-434/igt@kms_vblank@wait-forked-busy.html">INCOMPLETE</a> +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_ccs@suspend-resume.html">FAIL=
</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@xe_drm_fdinfo@utilization-othe=
rs-full-load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998"=
>Intel XE#2998</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12342/shard-dg2-436/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> =
+1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12342_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767=
</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +1=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-2/igt@kms_async_flips@crc-atomic@pipe-=
a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3781">Intel XE#3781</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_async_flips@crc-atomic@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3781">Intel XE#3781</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
8">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_bw@linear-tiling-1-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-1=
80-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12342/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12342/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-m=
c-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
24">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to=
-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-2/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_content_protection@legacy.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12342/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12342/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_feature_discovery@psr1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2342/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
97">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@cd-d=
p2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-=
6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recrea=
te@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/s=
hard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-suspend-inter=
ruptible@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12342/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp=
2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp=
-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +13 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_plane@plane-panning-bottom-r=
ight-suspend@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp=
-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12342/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a=
-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_pm_backlight@fade-with-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_psr@fbc-psr2-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_rotation_crc@primary-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-8=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-434/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0=
x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@virtual-utilization-single-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_drm_fdinfo@virtual-utilizatio=
n-single-idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3869">Intel XE#3869</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_eudebug@discovery-race-vmbind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_eudebug_online@resume-dss.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
42/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel =
XE#1600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many=
-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_evict@evict-beng-threads-larg=
e.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_evict@evict-mixed-many-thread=
s-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@xe_exec_fault_mode@twice-userp=
tr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_oa@unprivileged-single-ctx-co=
unters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2248">Intel XE#2248</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-lnl-2/igt@xe_pm@=
s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3088">Intel XE#3088</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@xe_query@multigpu-query-topolo=
gy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-even=
ts.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12342/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-=
flip-events.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12342/shard-lnl-5/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@p=
ipe-b-dp-4.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-d=
g2-mc-ccs@pipe-b-dp-4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">=
Intel XE#2425</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12342/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">=
Intel XE#3070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12342/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-dg2-435/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +10 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ac-dp=
2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
42/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_flip@flip-vs-expired-v=
blank-interruptible@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321=
">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12342/shard-dg2-463/igt@kms_flip@flip-vs-expired-vbl=
ank@b-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.=
html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12342/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend@pip=
e-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/361">Intel XE#361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12342/shard-dg2-436/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-l=
nl-5/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shar=
d-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12342/shard-bmg-3/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12342/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3864">Intel XE#3864</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-susp=
end.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-436/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE=
#1616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12342/shard-dg2-463/igt@xe_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12342/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-s=
mall.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invali=
date.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12342/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-use=
rptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3865">Intel XE=
#3865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12342/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1234=
2/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8164/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8164/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8164/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8164/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
164/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8164/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8164/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8164/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
42/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12342/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12342/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12342/shard-bmg-3/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12342/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-7/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12342/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12342/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12342/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12342/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12342/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12342/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">In=
tel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-p=
gflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) =
+4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-8/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12342/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12342/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12342/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">DMESG-F=
AIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
342/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1=
000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-2/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel =
XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12342/shard-bmg-6/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#10=
00</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8164/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3765">Intel=
 XE#3765</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12342/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel =
XE#3421</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8164 -&gt; IGTPW_12342</li>
<li>Linux: xe-2396-e9a5d74b7f60fe6f7d55ebe636ff871214b6caec -&gt; xe-2397-d=
8f0c44e2ed948dcc45d04a0dfa83612995a702b</li>
</ul>
<p>IGTPW_12342: d6f2757dca13107ae4337520c30c846df6a3216d @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8164: e9d9934c7c6dc6878792d82424fc928e7f6996cb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2396-e9a5d74b7f60fe6f7d55ebe636ff871214b6caec: e9a5d74b7f60fe6f7d55ebe=
636ff871214b6caec<br />
  xe-2397-d8f0c44e2ed948dcc45d04a0dfa83612995a702b: d8f0c44e2ed948dcc45d04a=
0dfa83612995a702b</p>

</body>
</html>

--===============6991235152398967910==--
