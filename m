Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF12E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 11:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E3E10E87A;
	Fri,  3 Jan 2025 11:08:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ED210E878;
 Fri,  3 Jan 2025 11:08:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2795309209556451541=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_single_engine_busyness?=
 =?utf-8?q?_stats_in_GPUTOP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jan 2025 11:08:44 -0000
Message-ID: <173590252466.2563600.819699100597052975@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250103065304.45781-1-soham.purkait@intel.com>
In-Reply-To: <20250103065304.45781-1-soham.purkait@intel.com>
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

--===============2795309209556451541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add single engine busyness stats in GPUTOP
URL   : https://patchwork.freedesktop.org/series/143086/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8174_full -> XEIGTPW_12378_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12378_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12378_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12378_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-6.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-x:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-x.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-x.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5.html

  * igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html

  * igt@kms_flip@modeset-vs-vblank-race@a-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-4/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][9] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][10] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][11] -> [FAIL][12] +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-8/igt@xe_evict@evict-large-multi-vm.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@xe_evict@evict-large-multi-vm.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12378_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3157])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#827])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#3948])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#3719]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-5-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#3767]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-5-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2550]) +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3279])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2136] / [Intel XE#2231])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3658])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1407]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1428])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2314] / [Intel XE#2894])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#367]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#367])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#3862])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#3432]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#787]) +95 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#1727]) +2 other tests incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#3124])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1727] / [Intel XE#3113])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][51] -> [DMESG-WARN][52] ([Intel XE#1727])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2887]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#373]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#306])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2252]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#373]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1178]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_content_protection@atomic-dpms@pipe-a-dp-5.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2341]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#3278]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2321]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2321])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1424]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2320]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#3007]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#309]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#1475])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2286])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#2141]) +2 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#3383])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2244])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#2882])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#3321]) +3 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#3149])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1421]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#3879]) +5 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][82] -> [FAIL][83] ([Intel XE#301]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][84] ([Intel XE#301]) +1 other test fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#2882] / [Intel XE#3288]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][87] ([Intel XE#2597]) +1 other test incomplete
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][88] ([Intel XE#2049])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#3098])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-4/igt@kms_flip@modeset-vs-vblank-race.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2293]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1401] / [Intel XE#1745])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2311]) +18 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#651]) +6 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#651]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#2333]) +6 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#656]) +21 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2352]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2313]) +28 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1469])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#653]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1503])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_hdr@static-toggle.html

  * igt@kms_histogram@global-basic:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#3898]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_histogram@global-basic.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#346])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2927])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2763]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +14 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2763]) +8 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#908])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2499])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#2446])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@kms_pm_rpm@cursor.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2893])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1489])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1489]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#3414])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2413])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1435])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#2159]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1499])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1499])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#756])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#756]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1091] / [Intel XE#2849])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-lnl:          NOTRUN -> [FAIL][136] ([Intel XE#3869])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2905]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2905]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#3889])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug_online@single-step:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2905]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#688]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][142] ([Intel XE#2364])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#1600])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1392]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1130]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2322]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#288]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1192])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@system:
    - shard-bmg:          [PASS][149] -> [SKIP][150] ([Intel XE#1130]) +23 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@xe_mmap@system.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_mmap@system.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#378])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_module_load@force-load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1420] / [Intel XE#2838])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2284])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#584])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#579])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#944])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#944])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#944])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#3342])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][162] ([Intel XE#877]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][164] ([Intel XE#3321]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][166] ([Intel XE#301]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][168] ([Intel XE#2597]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][170] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
    - shard-bmg:          [FAIL][172] ([Intel XE#2882]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2-set2:     [INCOMPLETE][174] -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-434/igt@kms_hdr@bpc-switch.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][176] -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [INCOMPLETE][178] ([Intel XE#1035]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_sequence@get-forked-busy:
    - shard-bmg:          [INCOMPLETE][180] ([Intel XE#3313]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_sequence@get-forked-busy.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_sequence@get-forked-busy.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][182] -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][184] ([Intel XE#2883]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][186] ([Intel XE#899]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][188] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][190] ([Intel XE#1473]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [INCOMPLETE][192] ([Intel XE#3865]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [SKIP][216], [PASS][217], [PASS][218], [PASS][219]) ([Intel XE#378]) -> ([PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-7/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-2/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-8/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-8/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-4/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-6/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_module_load@load.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][245] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [INCOMPLETE][247] -> [PASS][248] +2 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][249] ([Intel XE#958]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@crc:
    - shard-bmg:          [INCOMPLETE][251] ([Intel XE#3781]) -> [INCOMPLETE][252] ([Intel XE#3781] / [Intel XE#3946]) +1 other test incomplete
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-3/igt@kms_async_flips@crc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2-set2:     [INCOMPLETE][253] ([Intel XE#3781]) -> [INCOMPLETE][254] ([Intel XE#3781] / [Intel XE#3946]) +1 other test incomplete
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-435/igt@kms_async_flips@crc-atomic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_async_flips@crc-atomic.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][255] ([Intel XE#2327]) -> [SKIP][256] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][257] ([Intel XE#1124]) -> [SKIP][258] ([Intel XE#2136] / [Intel XE#2231])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][259] ([Intel XE#2887]) -> [SKIP][260] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          [SKIP][261] ([Intel XE#2252]) -> [SKIP][262] ([Intel XE#3007])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][263] ([Intel XE#2244]) -> [SKIP][264] ([Intel XE#2136] / [Intel XE#2231])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][265] ([Intel XE#2597]) -> [FAIL][266] ([Intel XE#3879])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][267] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][268] ([Intel XE#2136] / [Intel XE#2231])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][269] ([Intel XE#877]) -> [FAIL][270] ([Intel XE#2333])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [FAIL][271] ([Intel XE#2333]) -> [SKIP][272] ([Intel XE#2136] / [Intel XE#2231])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][273] ([Intel XE#2311]) -> [SKIP][274] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][275] ([Intel XE#2313]) -> [SKIP][276] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][277] ([Intel XE#2493]) -> [SKIP][278] ([Intel XE#3007])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][279] ([Intel XE#2763]) -> [SKIP][280] ([Intel XE#3007])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][281] ([Intel XE#1489]) -> [SKIP][282] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][283] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][284] ([Intel XE#2136] / [Intel XE#2231])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-1/igt@kms_psr@psr2-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_psr@psr2-suspend.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][285] ([Intel XE#2426]) -> [FAIL][286] ([Intel XE#1729])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#362]) -> [FAIL][288] ([Intel XE#1729])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][289] ([Intel XE#1499]) -> [SKIP][290] ([Intel XE#3007])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-7/igt@kms_vrr@max-min.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][291] ([Intel XE#2905]) -> [SKIP][292] ([Intel XE#1130])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          [SKIP][293] ([Intel XE#2322]) -> [SKIP][294] ([Intel XE#1130])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][295] ([Intel XE#2245]) -> [SKIP][296] ([Intel XE#1130])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-8/igt@xe_pat@pat-index-xelp.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][297] ([Intel XE#944]) -> [SKIP][298] ([Intel XE#1130])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#3313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3313
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3865
  [Intel XE#3869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3869
  [Intel XE#3879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3898]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3898
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3946
  [Intel XE#3948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3948
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * IGT: IGT_8174 -> IGTPW_12378
  * Linux: xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642 -> xe-2428-048d83e7f9dae81c058d31c371634c1c317b3013

  IGTPW_12378: 12378
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355c59adffd72fb2c642
  xe-2428-048d83e7f9dae81c058d31c371634c1c317b3013: 048d83e7f9dae81c058d31c371634c1c317b3013

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/index.html

--===============2795309209556451541==
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
<tr><td><b>Series:</b></td><td>Add single engine busyness stats in GPUTOP</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143086/">https://patchwork.freedesktop.org/series/143086/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12378/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12378/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8174_full -&gt; XEIGTPW_12378_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12378_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12378_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
378_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_async_flips@alternate-s=
ync-async-flip-atomic@pipe-d-hdmi-a-6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-even=
ts-atomic@pipe-b-hdmi-a-6-x.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@as=
ync-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-x.html">INCOMPLETE</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-a-dp-5.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ad-d=
p2-hdmi-a3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-4/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1237=
8/shard-lnl-6/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-=
crc@pipe-b-hdmi-a-3.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_psr@fbc-psr2-dpms.html">FAIL=
</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/sh=
ard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html">FAIL</a> +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-8/igt@xe_evict@evict-large-multi-vm.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-b=
mg-5/igt@xe_evict@evict-large-multi-vm.html">INCOMPLETE</a> +1 other test i=
ncomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12378_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12378/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip-a=
tomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-even=
ts-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@async-flip-with-page=
-flip-events-atomic.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3948">Intel XE#3948</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12378/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-fli=
p-events-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3719">Intel XE#3719</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-5-=
4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-a-dp-5-4-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-cc=
s:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-c-dp-5-4-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12378/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe=
-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-=
bmg-ccs@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basi=
c-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-=
tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12378/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-d-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_ccs@random-ccs-data-y-tiled-=
gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128=
x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_cursor_crc@cursor-random-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top-bottom.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
78/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel =
XE#3007</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12378/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3383">Intel XE#3383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12378/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank@bc-hdmi-a6-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank@cd-hdmi-a6-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2=
-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12378/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptib=
le@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3879">Intel XE#3879</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-=
hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12378/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interrup=
tible@d-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interru=
ptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_flip@flip-vs-suspend-inter=
ruptible@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-4/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard=
-lnl-6/igt@kms_flip@modeset-vs-vblank-race.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p=
-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +6 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +28 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2=
p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">=
Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_histogram@global-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
898">Intel XE#3898</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-unity-scaling@pipe-c.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other =
tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">In=
tel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@k=
ms_pm_rpm@cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@kms_psr@pr-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_psr@psr2-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel=
 XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_writeback@writeback-pixel-=
formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others=
-full-load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3869">Intel XE#3869</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@xe_eudebug@basic-exec-queues.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@xe_eudebug@basic-vm-access.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_eudebug@basic-vm-access-param=
eters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_evict@evict-cm-threads-small-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2364">Intel XE#2364</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-=
cm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-n=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@xe_exec_fault_mode@twice-userp=
tr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@xe_live_ktest@xe_bo.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">In=
tel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@xe_mmap@system.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_mma=
p@system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1130">Intel XE#1130</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
8">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_pm@s3-basic-exec.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Int=
el XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-dg2-435/igt@xe_query@multigpu-query-topolo=
gy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-t=
oggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12378/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12378/shard-dg2-436/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@kms_flip@flip-vs-suspend-in=
terruptible@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/259=
7">Intel XE#2597</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2635">Intel XE#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12378/shard-bmg-5/igt@kms_flip@flip-vs-suspend@d-=
hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreat=
e-interruptible@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-434/igt@kms_hdr@bpc-switch.html">INCOMPLETE</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-=
436/igt@kms_hdr@bpc-switch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html"=
>FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12378/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1035">Intel XE#1035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_plane@plane-panning-bottom-=
right-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_sequence@get-forked-busy.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3313">Int=
el XE#3313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12378/shard-bmg-1/igt@kms_sequence@get-forked-busy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-=
lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12378/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12378/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-dg2-434/igt@xe_evict@evict-ben=
g-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12378/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-s=
mall.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3865">Intel XE=
#3865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12378/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8174/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8174/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8174/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8174/shard-lnl-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8174/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard=
-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
174/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8174/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-1/igt@xe_module_loa=
d@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8174/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8174/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12378/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12378/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12378/shard-lnl-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard=
-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
378/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12378/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12378/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12378/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12378/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12378/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12378/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-ln=
l-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12378/shard-lnl-5/igt@xe_module_load@load.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#=
1607</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12378/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html">INCOMPLET=
E</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1237=
8/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> +2 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#9=
58</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
378/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-3/igt@kms_async_flips@crc.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Intel XE#378=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
78/shard-bmg-3/igt@kms_async_flips@crc.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Intel XE#3781</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3946">Intel =
XE#3946</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-435/igt@kms_async_flips@crc-atomic.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Int=
el XE#3781</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12378/shard-dg2-435/igt@kms_async_flips@crc-atomic.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">In=
tel XE#3781</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3946">Intel XE#3946</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12378/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-=
hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_big_fb@y-tile=
d-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Int=
el XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12378/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-hibernate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-hi=
bernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">In=
tel XE#2244</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12378/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel X=
E#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12378/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879">Intel XE#3879</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_=
flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-ind=
fb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-move.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
1">Intel XE#2231</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2=
493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2378/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-wi=
th-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_plane_scaling@=
plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12378/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-1/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12378/shard-bmg-3/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">In=
tel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12378/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12378/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/shard-b=
mg-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel=
 XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12378/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12378/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-reb=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12378/s=
hard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8174/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/94=
4">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12378/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8174 -&gt; IGTPW_12378</li>
<li>Linux: xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642 -&gt; xe-2428-0=
48d83e7f9dae81c058d31c371634c1c317b3013</li>
</ul>
<p>IGTPW_12378: 12378<br />
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355=
c59adffd72fb2c642<br />
  xe-2428-048d83e7f9dae81c058d31c371634c1c317b3013: 048d83e7f9dae81c058d31c=
371634c1c317b3013</p>

</body>
</html>

--===============2795309209556451541==--
