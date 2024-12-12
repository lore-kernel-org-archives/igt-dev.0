Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8039CE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 13:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A33E10E04E;
	Thu, 12 Dec 2024 13:44:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4CC10E02B;
 Thu, 12 Dec 2024 13:44:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1318150448974087404=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_ultra_joiner_to_kms=5F?=
 =?utf-8?q?invalid=5Fmode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 13:44:02 -0000
Message-ID: <173401104253.1586471.998516239137517615@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
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

--===============1318150448974087404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add ultra joiner to kms_invalid_mode (rev2)
URL   : https://patchwork.freedesktop.org/series/142027/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8150_full -> XEIGTPW_12303_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12303_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12303_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12303_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12303_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1727]) +10 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2328])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#2705])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#3432])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#306])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3278])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2286])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#2141]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#776]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2374])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1421]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#3321]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [PASS][37] -> [ABORT][38] ([Intel XE#3468]) +1 other test abort
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#3468]) +16 other tests dmesg-fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2316])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][44] -> [INCOMPLETE][45] ([Intel XE#2635])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][46] ([Intel XE#3468]) +2 other tests dmesg-fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#3468]) +87 other tests dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [PASS][49] -> [DMESG-FAIL][50] ([Intel XE#1727] / [Intel XE#3468]) +9 other tests dmesg-fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#886]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [PASS][53] -> [INCOMPLETE][54] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests incomplete
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293] / [Intel XE#2380])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1401] / [Intel XE#1745])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1401])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][59] ([Intel XE#2705] / [Intel XE#3468])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][60] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#651])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2311]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#2333]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#656]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2312]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#1503])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-bmg:          [PASS][69] -> [INCOMPLETE][70] ([Intel XE#1035] / [Intel XE#1727] / [Intel XE#3468])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_plane@plane-position-hole-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2571])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2763]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2763]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#718])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2499])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
    - shard-bmg:          [PASS][78] -> [DMESG-WARN][79] ([Intel XE#1727] / [Intel XE#3468]) +24 other tests dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1489]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2413])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#2883]) +2 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1435])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#899])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1499])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#1522]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-2/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#1499])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_vrr@negative-basic.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#756])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2905]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-3/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2905]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#688]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1392]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-3/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2322])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@no-exec-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][99] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_exec_basic@no-exec-basic-defer-mmap.html

  * igt@xe_exec_reset@spin-signaled:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][100] ([Intel XE#3468]) +8 other tests dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@xe_exec_reset@spin-signaled.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [PASS][101] -> [DMESG-WARN][102] ([Intel XE#3343]) +2 other tests dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][105] ([Intel XE#3467])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][106] ([Intel XE#1727] / [Intel XE#3468])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1192]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [PASS][109] -> [SKIP][110] ([Intel XE#1192])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#3467]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@reload-no-display.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2427])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2284] / [Intel XE#366])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][115] -> [DMESG-WARN][116] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][117] -> [ABORT][118] ([Intel XE#1794])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-bmg:          [PASS][119] -> [DMESG-WARN][120] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#958])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#944])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#944])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][125] ([Intel XE#3719]) -> [PASS][126] +3 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][127] ([Intel XE#3468]) -> [PASS][128] +8 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [DMESG-WARN][129] -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][131] ([Intel XE#877]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][133] ([Intel XE#2291]) -> [PASS][134] +2 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][135] ([Intel XE#2882]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][137] ([Intel XE#2316]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][139] ([Intel XE#886]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [INCOMPLETE][141] ([Intel XE#2635]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible@a-dp2:
    - shard-bmg:          [INCOMPLETE][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@a-dp2.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_flip@flip-vs-panning-interruptible@a-dp2.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][145] ([Intel XE#718]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [DMESG-WARN][147] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_pm_rpm@basic-pci-d3-state.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr2-sprite-blt@edp-1:
    - shard-lnl:          [FAIL][149] -> [PASS][150] +3 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-5/igt@kms_psr@psr2-sprite-blt@edp-1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-4/igt@kms_psr@psr2-sprite-blt@edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][151] ([Intel XE#2159]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [DMESG-WARN][153] ([Intel XE#3467]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][155], [PASS][156], [PASS][157], [SKIP][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180]) ([Intel XE#2457]) -> ([PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][205] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [DMESG-WARN][207] ([Intel XE#1727]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@xe_query@query-invalid-uc-fw-version-mbz.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_query@query-invalid-uc-fw-version-mbz.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#3468]) -> [PASS][210] +45 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#2919] / [Intel XE#3468]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_wedged@basic-wedged.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [DMESG-WARN][213] ([Intel XE#3468]) -> [SKIP][214] ([Intel XE#2291])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][215] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][216] ([Intel XE#3468]) +1 other test dmesg-warn
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][217] ([Intel XE#2882]) -> [SKIP][218] ([Intel XE#2316])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#2955] / [Intel XE#3468]) -> [DMESG-WARN][220] ([Intel XE#1727] / [Intel XE#3468])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][221] ([Intel XE#3468]) -> [DMESG-WARN][222] ([Intel XE#1727] / [Intel XE#3468])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][223] ([Intel XE#2316]) -> [DMESG-WARN][224] ([Intel XE#3468])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [DMESG-WARN][225] ([Intel XE#3468]) -> [FAIL][226] ([Intel XE#2882]) +2 other tests fail
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [FAIL][227] ([Intel XE#2333]) -> [DMESG-FAIL][228] ([Intel XE#3468]) +4 other tests dmesg-fail
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-bmg:          [FAIL][229] ([Intel XE#2333]) -> [INCOMPLETE][230] ([Intel XE#3468])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][231] ([Intel XE#2312]) -> [FAIL][232] ([Intel XE#2333]) +1 other test fail
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [FAIL][233] ([Intel XE#2333]) -> [SKIP][234] ([Intel XE#2312]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][235] ([Intel XE#2312]) -> [DMESG-FAIL][236] ([Intel XE#3468]) +1 other test dmesg-fail
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [FAIL][237] ([Intel XE#2333]) -> [INCOMPLETE][238] ([Intel XE#1727])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][239] ([Intel XE#3468]) -> [FAIL][240] ([Intel XE#2333]) +2 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][241] ([Intel XE#3468]) -> [SKIP][242] ([Intel XE#2312]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][243] ([Intel XE#2312]) -> [SKIP][244] ([Intel XE#2311]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][245] ([Intel XE#2311]) -> [SKIP][246] ([Intel XE#2312]) +13 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][247] ([Intel XE#2313]) -> [SKIP][248] ([Intel XE#2312]) +9 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [INCOMPLETE][249] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468]) -> [FAIL][250] ([Intel XE#2333])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          [INCOMPLETE][251] ([Intel XE#1727] / [Intel XE#3468]) -> [FAIL][252] ([Intel XE#2333])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][253] ([Intel XE#2312]) -> [SKIP][254] ([Intel XE#2313]) +6 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][255] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][256] ([Intel XE#3544])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [INCOMPLETE][257] ([Intel XE#2864]) -> [DMESG-WARN][258] ([Intel XE#1727] / [Intel XE#3468])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-bmg:          [INCOMPLETE][259] -> [DMESG-WARN][260] ([Intel XE#1727] / [Intel XE#3468])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][261] ([Intel XE#1473]) -> [INCOMPLETE][262] ([Intel XE#1473])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [INCOMPLETE][263] ([Intel XE#1473]) -> [TIMEOUT][264] ([Intel XE#1473])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [FAIL][265] ([Intel XE#1000]) -> [TIMEOUT][266] ([Intel XE#1473] / [Intel XE#2472])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-3/igt@xe_evict@evict-threads-large.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_evict@evict-threads-large.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-WARN][267] ([Intel XE#3467]) -> [DMESG-WARN][268] ([Intel XE#3467] / [Intel XE#3468])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][269] ([Intel XE#3625]) -> [DMESG-WARN][270] ([Intel XE#3467])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-8/igt@xe_module_load@many-reload.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [DMESG-WARN][271] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][272] ([Intel XE#3467]) +1 other test dmesg-warn
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_module_load@reload.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@reload.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [DMESG-WARN][273] ([Intel XE#3468]) -> [DMESG-FAIL][274] ([Intel XE#1727] / [Intel XE#3468])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
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
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * IGT: IGT_8150 -> IGTPW_12303
  * Linux: xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 -> xe-2360-e70dbc9b6fd6666891756ed53e0404e0b48b11de

  IGTPW_12303: fa119712f99a83f90b67ac6216ab34b1fd736137 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292: b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292
  xe-2360-e70dbc9b6fd6666891756ed53e0404e0b48b11de: e70dbc9b6fd6666891756ed53e0404e0b48b11de

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/index.html

--===============1318150448974087404==
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
<tr><td><b>Series:</b></td><td>Add ultra joiner to kms_invalid_mode (rev2)<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142027/">https://patchwork.freedesktop.org/series/142027/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12303/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12303/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8150_full -&gt; XEIGTPW_12303_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12303_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12303_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
303_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1230=
3/shard-bmg-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">DMESG-WARN</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-25=
6x256@pipe-d-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-=
dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-inter=
ruptible@ad-dp2-hdmi-a3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12303_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_atomic_transition@plane-primary-toggle-with-=
vblank-wait.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_atomic_transition@plane-primary-=
toggle-with-vblank-wait.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +10 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-2160x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12303/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-2=
160x1440p.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12303/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12303/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-=
hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@kms_flip@2x-dpms-vs-vblank-race.=
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
/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbla=
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
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg=
-5/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other t=
est abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>) +16 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/sh=
ard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12303/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@flip-vs-blocking-wf-vbl=
ank@a-dp2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303=
/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +87 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-=
bmg-8/igt@kms_flip@flip-vs-suspend@c-dp2.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12303/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4t=
ile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_flip_scale=
d_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_flip_tiling@flip-change-tili=
ng@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_flip_tiling@flip-change-tili=
ng@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_plane@plane-position-hole-dpms.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/sh=
ard-bmg-7/igt@kms_plane@plane-position-hole-dpms.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1=
035</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1230=
3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE=
#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-8/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2303/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +24 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@k=
ms_setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12303/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-ln=
l-2/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/ig=
t@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-3/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_eudebug@multigpu-basic-client=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-pa=
rallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-3/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bind=
execqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_exec_basic@no-exec-basic-defe=
r-mmap.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@spin-signaled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@xe_exec_reset@spin-signaled.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_ct_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_fault_injection@inject-fault-pr=
obe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +2 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_pm_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_fault_injection@inject-fault-=
probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_fault_injection@vm-create-fai=
l-xe_pt_create.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@x=
e_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt=
@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@xe_module_load@reload-no-display.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shar=
d-bmg-7/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/i=
gt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel=
 XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-lnl-2/=
igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-2/=
igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-ln=
l-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-lnl-6/igt@xe_query@multigpu-query-invalid-=
query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a=
-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_ccs@crc-primary-ba=
sic-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12303/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-l=
egacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-f=
lipa-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
303/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Int=
el XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12303/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2635">Intel XE#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_flip@flip-vs-panning-interruptibl=
e.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@a-dp2.htm=
l">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12303/shard-bmg-7/igt@kms_flip@flip-vs-panning-interruptible@a-dp2.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-=
lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">In=
tel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_pm_rpm@basic-pci-d3-state.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-5/igt@kms_psr@psr2-sprite-blt@edp-1.html">FAIL</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-l=
nl-4/igt@kms_psr@psr2-sprite-blt@edp-1.html">PASS</a> +3 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#215=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
03/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops=
_run.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_fault_injection@vm-b=
ind-fail-xe_pt_update_ops_run.html">PASS</a> +1 other test pass</li>
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
03/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12303/shard-bmg-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12303/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12303/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12303/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>)</li>
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
tree/intel-xe/IGTPW_12303/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@xe_query@query-invalid-uc-fw-version-mbz.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12303/shard-bmg-7/igt@xe_query@query-invalid-uc-fw-versio=
n-mbz.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-time=
out.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_sysfs_preempt_timeout=
@preempt_timeout_us-timeout.html">PASS</a> +45 other tests pass</li>
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
ntel-xe/IGTPW_12303/shard-bmg-8/igt@xe_wedged@basic-wedged.html">PASS</a></=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2291">Intel XE#2291</a>)</li>
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
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@=
2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Int=
el XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12303/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>)</li>
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
ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmf=
b-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hd=
mi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-rm=
fb-interruptible@ab-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12303/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">=
Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12303/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">In=
tel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shr=
fb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-1p-offscren-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">In=
tel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12303/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1=
 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12303/shard-bmg-7/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-cur-indfb-move.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-5/igt@kms_frontbuffer_tracki=
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2050">Intel XE#2050</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontb=
uffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-=
2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuf=
fer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-3/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12303/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864"=
>Intel XE#2864</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12303/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html">DMES=
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
GTPW_12303/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12303/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-thr=
eads-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12303/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-la=
rge.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-3/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#=
1000</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12303/shard-bmg-6/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#14=
73</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/247=
2">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_execute.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12303/shard-bmg-8/igt@xe_fault_injection=
@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel=
 XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-8/igt@xe_module_load@many-reload.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625">Intel XE#36=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
303/shard-bmg-5/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#346=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3=
467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12303/shard-bmg-4/igt@xe_module_load@reload.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">In=
tel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8150/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12303/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8150 -&gt; IGTPW_12303</li>
<li>Linux: xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 -&gt; xe-2360-e=
70dbc9b6fd6666891756ed53e0404e0b48b11de</li>
</ul>
<p>IGTPW_12303: fa119712f99a83f90b67ac6216ab34b1fd736137 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292: b34d1ff04eaa0ed48ef25f1=
d758d2a55f7c3c292<br />
  xe-2360-e70dbc9b6fd6666891756ed53e0404e0b48b11de: e70dbc9b6fd6666891756ed=
53e0404e0b48b11de</p>

</body>
</html>

--===============1318150448974087404==--
