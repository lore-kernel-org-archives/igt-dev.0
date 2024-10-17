Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D874D37487
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 13:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FD910E334;
	Thu, 17 Oct 2024 13:12:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D02810E32E;
 Thu, 17 Oct 2024 13:12:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4706442878363796348=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/kms=5Fwriteback=3A_Add_?=
 =?utf-8?q?clone_mode_subtest_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 17 Oct 2024 13:12:41 -0000
Message-ID: <172917076110.1278841.17388678297552583149@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016-igt-cwb-v5-0-8938d43f0b0f@quicinc.com>
In-Reply-To: <20241016-igt-cwb-v5-0-8938d43f0b0f@quicinc.com>
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

--===============4706442878363796348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_writeback: Add clone mode subtest (rev5)
URL   : https://patchwork.freedesktop.org/series/137933/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8077_full -> XEIGTPW_11927_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11927_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11927_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11927_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +10 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-464/igt@kms_color@ctm-green-to-red@pipe-b-dp-4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_color@ctm-green-to-red@pipe-b-dp-4.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html

  * {igt@kms_writeback@check-valid-clones} (NEW):
    - {shard-bmg}:        NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@kms_writeback@check-valid-clones.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_writeback@check-valid-clones.html
    - shard-lnl:          NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_writeback@check-valid-clones.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][10] ([Intel XE#301]) -> [DMESG-WARN][11] +5 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_sequence@get-idle:
    - {shard-bmg}:        [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-1/igt@kms_sequence@get-idle.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@kms_sequence@get-idle.html

  
New tests
---------

  New tests have been introduced between XEIGT_8077_full and XEIGTPW_11927_full:

### New IGT tests (2) ###

  * igt@kms_writeback@check-valid-clones:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_writeback@dump-writeback:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11927_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#623])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][16] ([Intel XE#877])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#619]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2669]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2907]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +97 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#314]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#306])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1178]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#308])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#309])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#323]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1138])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1137])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#301]) +4 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1204])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [FAIL][45] ([Intel XE#886]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#886]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401] / [Intel XE#1745])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1397] / [Intel XE#1745])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1397])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455]) +14 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#651]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#651]) +29 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#656]) +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653]) +26 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#2050])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#658])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#455])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#346])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-432/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-2:
    - shard-lnl:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#324]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][65] -> [DMESG-FAIL][66] ([Intel XE#324]) +2 other tests dmesg-fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#616]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_plane_cursor@viewport.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#599]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#361])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#870])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#2029])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-lnl:          [PASS][75] -> [DMESG-FAIL][76] ([Intel XE#1620]) +2 other tests dmesg-fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_pm_rpm@cursor-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#2446])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#1620] / [Intel XE#2864])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1489]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2893]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1122])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1406]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1127])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1437])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1127])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#327]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#2159]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#2443]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#756]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1091] / [Intel XE#2849])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [PASS][95] -> [ABORT][96] ([Intel XE#2625]) +1 other test abort
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-464/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1280] / [Intel XE#455]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1126])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2905]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2905]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#688]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][102] -> [TIMEOUT][103] ([Intel XE#1473])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1392]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1130])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-435/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#2754])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#288]) +21 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2360])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2931])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2229])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#560])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#378])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2541]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#979])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          [PASS][117] -> [ABORT][118] ([Intel XE#1358] / [Intel XE#1616])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2284] / [Intel XE#366])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [PASS][120] -> [ABORT][121] ([Intel XE#1358])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_pm@s4-basic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_pm@s4-basic.html
    - shard-lnl:          [PASS][122] -> [ABORT][123] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@xe_pm@s4-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][124] -> [ABORT][125] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#958])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#944]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1130]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_sysfs_scheduler@preempt_timeout_us-invalid.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs:
    - shard-lnl:          [INCOMPLETE][131] -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][133] ([Intel XE#1701]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#1426]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - {shard-bmg}:        [SKIP][137] ([Intel XE#2231]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - {shard-bmg}:        [SKIP][139] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#2890]) -> [PASS][142] +7 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][144] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#1195]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#2423] / [i915#2575]) -> [PASS][148] +18 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][149] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][151] ([Intel XE#1475]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - {shard-bmg}:        [DMESG-WARN][153] ([Intel XE#877]) -> [PASS][154] +3 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_feature_discovery@display-1x:
    - {shard-bmg}:        [SKIP][155] -> [PASS][156] +16 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_feature_discovery@display-1x.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][157] ([Intel XE#301]) -> [PASS][158] +2 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - {shard-bmg}:        [SKIP][159] ([Intel XE#3007]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][161] ([Intel XE#886]) -> [PASS][162] +3 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [ABORT][163] ([Intel XE#1035] / [Intel XE#2625]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-3:
    - shard-lnl:          [DMESG-FAIL][165] ([Intel XE#324]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][167] ([Intel XE#324]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [DMESG-FAIL][169] ([Intel XE#1620]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [INCOMPLETE][171] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes@plane-41:
    - shard-lnl:          [DMESG-WARN][173] ([Intel XE#1620]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-41.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-41.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-lnl:          [FAIL][175] -> [PASS][176] +3 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          [FAIL][177] ([Intel XE#1649]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [FAIL][179] ([Intel XE#2443]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - {shard-bmg}:        [INCOMPLETE][181] -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][183] ([Intel XE#1473]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#1000]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1130]) -> [PASS][188] +22 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - {shard-bmg}:        [DMESG-WARN][189] -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@xe_exec_reset@close-execqueues-close-fd.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-1/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-dg2-set2:     [FAIL][191] -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-436/igt@xe_exec_reset@cm-close-fd.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [SKIP][193] ([Intel XE#1192]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - {shard-bmg}:        [FAIL][195] ([Intel XE#3099]) -> [PASS][196] +2 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [ABORT][197] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-432/igt@xe_pm@s2idle-basic.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - {shard-bmg}:        [SKIP][199] ([Intel XE#1130]) -> [PASS][200] +37 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][201] ([Intel XE#1794]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][204] ([Intel XE#1124])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2890]) -> [SKIP][206] ([Intel XE#1124])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2423] / [i915#2575]) -> [SKIP][208] ([Intel XE#367])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][209] ([Intel XE#1195]) -> [INCOMPLETE][210] ([Intel XE#1195] / [Intel XE#1727])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#2890]) -> [SKIP][212] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2423] / [i915#2575]) -> [SKIP][214] ([Intel XE#373]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#1195] / [Intel XE#2715]) -> [FAIL][216] ([Intel XE#1178])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_content_protection@atomic.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#1195]) -> [FAIL][218] ([Intel XE#1178])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2423] / [i915#2575]) -> [SKIP][220] ([Intel XE#455]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_content_protection@content-type-change.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_content_protection@content-type-change.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][222] ([Intel XE#455])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2890]) -> [SKIP][224] ([Intel XE#651]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2890]) -> [SKIP][226] ([Intel XE#653]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][228] ([Intel XE#653]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#653]) -> [SKIP][230] ([Intel XE#2890])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2890]) -> [SKIP][232] ([Intel XE#1489]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][234] ([Intel XE#2890])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-436/igt@kms_psr@fbc-psr2-basic.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][236] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_psr@pr-dpms.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2890]) -> [SKIP][238] ([Intel XE#2850] / [Intel XE#929])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_psr@psr2-cursor-render.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#362]) -> [SKIP][240] ([Intel XE#1500])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1130]) -> [SKIP][242] ([Intel XE#1280] / [Intel XE#455])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1130]) -> [SKIP][244] ([Intel XE#2905]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1130]) -> [TIMEOUT][246] ([Intel XE#1473])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1130]) -> [SKIP][248] ([Intel XE#288]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1130]) -> [SKIP][250] ([Intel XE#2541]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@xe_oa@invalid-oa-metric-set-id.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8077 -> IGTPW_11927
  * Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 -> xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67

  IGTPW_11927: 11927
  IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519
  xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67: 87312f4bbb70018f831a8ef565db9cdc37b4da67

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/index.html

--===============4706442878363796348==
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
<tr><td><b>Series:</b></td><td>tests/kms_writeback: Add clone mode subtest (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137933/">https://patchwork.freedesktop.org/series/137933/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8077_full -&gt; XEIGTPW_11927_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11927_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11927_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11927_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-464/igt@kms_color@ctm-green-to-red@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_color@ctm-green-to-red@pipe-b-dp-4.html">DMESG-WARN</a> +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_writeback@check-valid-clones} (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@kms_writeback@check-valid-clones.html">SKIP</a> +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_writeback@check-valid-clones.html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_writeback@check-valid-clones.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_sequence@get-idle:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-1/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@kms_sequence@get-idle.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8077_full and XEIGTPW_11927_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_writeback@check-valid-clones:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@dump-writeback:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11927_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-432/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-464/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-435/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931">Intel XE#2931</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_sysfs_scheduler@preempt_timeout_us-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_feature_discovery@display-1x.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@kms_feature_discovery@display-1x.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-41.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-50.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-6/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-4/igt@kms_vrr@flip-basic-fastset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-1/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-436/igt@xe_exec_reset@cm-close-fd.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@xe_exec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-432/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-436/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-436/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-464/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8077/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11927/shard-dg2-463/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8077 -&gt; IGTPW_11927</li>
<li>Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 -&gt; xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67</li>
</ul>
<p>IGTPW_11927: 11927<br />
  IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519<br />
  xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67: 87312f4bbb70018f831a8ef565db9cdc37b4da67</p>

</body>
</html>

--===============4706442878363796348==--
