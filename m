Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C9C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 19:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5793F10E059;
	Sun,  6 Apr 2025 19:25:56 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C2610E059;
 Sun,  6 Apr 2025 19:25:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3823844891355622107=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/i915/fbc=3A_update_fbc?=
 =?utf-8?q?_support_based_on_psr_mode_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 19:25:55 -0000
Message-ID: <174396755506.41253.1778311792383887087@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327080358.559968-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250327080358.559968-1-vinod.govindapillai@intel.com>
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

--===============3823844891355622107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/fbc: update fbc support based on psr mode (rev3)
URL   : https://patchwork.freedesktop.org/series/146845/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8292_FULL -> XEIGTPW_12876_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12876_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12876_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12876_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - shard-dg2-set2:     [PASS][2] -> ([PASS][3], [INCOMPLETE][4]) +1 other test ( 1 incomplete, 1 pass )
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_vblank@ts-continuation-modeset-rpm.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [INCOMPLETE][5] -> ([FAIL][6], [INCOMPLETE][7]) ([Intel XE#1178]) +1 other test ( 1 fail, 1 incomplete )
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_content_protection@srm.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_content_protection@srm.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12876_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#4173]) +2 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-6/igt@core_hotunplug@hotreplug.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#3767]) +15 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][11] -> ([FAIL][12], [PASS][13]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][16], [SKIP][17]) ([Intel XE#2327])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#607])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#610])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#610])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1124]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][33] -> ([PASS][34], [SKIP][35]) ([Intel XE#2314] / [Intel XE#2894])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#2191]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][38], [SKIP][39]) ([Intel XE#2314] / [Intel XE#2894])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#2191])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#2191])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#2191]) +1 other test ( 2 skip )
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#367])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#787]) +168 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#787]) +56 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2887]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3432])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2887])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#455] / [Intel XE#787]) +18 other tests ( 2 skip )
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][60], [SKIP][61]) ([Intel XE#2907])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][62] -> ([PASS][63], [INCOMPLETE][64]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#2887]) +8 other tests ( 2 skip )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][67] -> ([PASS][68], [INCOMPLETE][69]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][70] -> [INCOMPLETE][71] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][72], [PASS][73]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4418])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#4417]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#4416]) +3 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2325])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#2325])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_chamelium_color@degamma.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#306])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-bmg:          NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#2252]) +1 other test ( 2 skip )
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_chamelium_frames@vga-frame-dump.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_chamelium_frames@vga-frame-dump.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][84], [SKIP][85]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_chamelium_frames@vga-frame-dump.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2252]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#373])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#373]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#373])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][91], [SKIP][92]) ([Intel XE#1178] / [Intel XE#455])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_content_protection@atomic.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#1178])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#307])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2390])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][97] ([Intel XE#1178])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][98], [SKIP][99]) ([Intel XE#2321]) +1 other test ( 2 skip )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x512.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][100], [SKIP][101]) ([Intel XE#308])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-lnl:          NOTRUN -> ([SKIP][102], [SKIP][103]) ([Intel XE#2321])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> ([SKIP][104], [SKIP][105]) ([Intel XE#2320]) +3 other tests ( 2 skip )
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1424])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#309])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2291])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][110] -> ([PASS][111], [SKIP][112]) ([Intel XE#2291]) +5 other tests ( 1 pass, 1 skip )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][113] -> ([PASS][114], [SKIP][115]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#309])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          NOTRUN -> ([PASS][118], [SKIP][119]) ([Intel XE#2291])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-dg2-set2:     NOTRUN -> ([PASS][120], [SKIP][121]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][122] -> ([SKIP][123], [SKIP][124]) ([Intel XE#2291])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#323])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([Intel XE#1508])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][128] -> ([SKIP][129], [PASS][130]) ([Intel XE#4302])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][131] -> ([PASS][132], [SKIP][133]) ([Intel XE#3009])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_dp_aux_dev.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_dp_aux_dev.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][134], [SKIP][135]) ([Intel XE#4354])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#4354])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][137] -> ([SKIP][138], [SKIP][139]) ([Intel XE#4294])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][140], [SKIP][141]) ([Intel XE#455]) +10 other tests ( 2 skip )
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> ([SKIP][142], [SKIP][143]) ([Intel XE#2244])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> ([SKIP][144], [SKIP][145]) ([Intel XE#776])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][146], [SKIP][147]) ([Intel XE#776])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][148] -> ([SKIP][149], [PASS][150]) ([Intel XE#2373])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#2373])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#2374])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#1135])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_feature_discovery@psr2.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([Intel XE#1421])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][159] -> ([PASS][160], [SKIP][161]) ([Intel XE#310]) +5 other tests ( 1 pass, 1 skip )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
    - shard-bmg:          [PASS][162] -> ([SKIP][163], [SKIP][164]) ([Intel XE#2316])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1421]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][166] -> [SKIP][167] ([Intel XE#310]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][168] ([Intel XE#301]) +2 other tests fail
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][169] ([Intel XE#3321]) +4 other tests fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> ([PASS][170], [SKIP][171]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-dg2-set2:     NOTRUN -> ([PASS][172], [SKIP][173]) ([Intel XE#310]) +2 other tests ( 1 pass, 1 skip )
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2316])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][175] -> ([PASS][176], [SKIP][177]) ([Intel XE#2316]) +8 other tests ( 1 pass, 1 skip )
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][178] -> [SKIP][179] ([Intel XE#2316])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> ([PASS][180], [INCOMPLETE][181]) ([Intel XE#2049])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@absolute-wf_vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][182] ([Intel XE#2049])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@absolute-wf_vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][183] -> ([FAIL][184], [PASS][185]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][186] -> ([FAIL][187], [PASS][188]) ([Intel XE#301]) +6 other tests ( 1 fail, 1 pass )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][189] -> ([FAIL][190], [PASS][191]) ([Intel XE#301]) +5 other tests ( 1 fail, 1 pass )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][192] -> ([PASS][193], [FAIL][194]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][195] -> ([PASS][196], [INCOMPLETE][197]) ([Intel XE#2049] / [Intel XE#2597])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][198] -> [DMESG-WARN][199] ([Intel XE#2953] / [Intel XE#4173])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][200] ([Intel XE#2049] / [Intel XE#2597])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][201] -> ([FAIL][202], [PASS][203]) ([Intel XE#886]) +3 other tests ( 1 fail, 1 pass )
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][204], [SKIP][205]) ([Intel XE#2293]) +2 other tests ( 2 skip )
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][206], [SKIP][207]) ([Intel XE#2293] / [Intel XE#2380]) +2 other tests ( 2 skip )
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][208], [SKIP][209]) ([Intel XE#1401] / [Intel XE#1745])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#1401])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#455]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][213] -> [DMESG-FAIL][214] ([Intel XE#4543]) +1 other test dmesg-fail
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2311]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][218], [SKIP][219]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][220], [SKIP][221]) ([Intel XE#2311]) +14 other tests ( 2 skip )
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#651]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#4141]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][224] -> ([SKIP][225], [PASS][226]) ([Intel XE#656]) +7 other tests ( 1 pass, 1 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#656]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [PASS][228] -> [SKIP][229] ([Intel XE#656]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#4141]) +9 other tests ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][232], [PASS][233]) ([Intel XE#656]) +4 other tests ( 1 pass, 1 skip )
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [PASS][234] -> ([SKIP][235], [SKIP][236]) ([Intel XE#656])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][237], [SKIP][238]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][239], [SKIP][240]) ([Intel XE#2312] / [Intel XE#4141])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#2312]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#651]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#651] / [Intel XE#656]) +4 other tests ( 2 skip )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
    - shard-bmg:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#2312])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#651])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#653]) +8 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][250], [SKIP][251]) ([Intel XE#2313]) +15 other tests ( 2 skip )
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#656]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][253], [SKIP][254]) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][255] ([Intel XE#2313])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#653]) +8 other tests ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#653] / [Intel XE#656]) +4 other tests ( 2 skip )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
    - shard-lnl:          NOTRUN -> ([SKIP][260], [SKIP][261]) ([Intel XE#656]) +5 other tests ( 2 skip )
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#3374] / [Intel XE#3544])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][264] -> ([SKIP][265], [SKIP][266]) ([Intel XE#455])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][267] -> ([PASS][268], [SKIP][269]) ([Intel XE#1503]) +2 other tests ( 1 pass, 1 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#1450]) +1 other test ( 2 skip )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][272], [SKIP][273]) ([Intel XE#1450] / [Intel XE#2568]) +1 other test ( 2 skip )
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][274] -> ([SKIP][275], [PASS][276]) ([Intel XE#4328])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
    - shard-bmg:          [PASS][277] -> [SKIP][278] ([Intel XE#3012])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][279] ([Intel XE#616]) +4 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][280], [PASS][281]) ([Intel XE#616])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][282] -> ([PASS][283], [SKIP][284]) ([Intel XE#4596])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][285], [DMESG-WARN][286]) ([Intel XE#4212])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> ([ABORT][287], [ABORT][288]) ([Intel XE#4540])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#2763]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][290] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][293] ([Intel XE#2763]) +9 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#870]) +1 other test ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_pm_backlight@fade.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][296], [SKIP][297]) ([Intel XE#870])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][298] ([Intel XE#1122])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][299] ([Intel XE#2392])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][300] ([Intel XE#1430])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][301], [SKIP][302]) ([Intel XE#908])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#1439] / [Intel XE#3141])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][304] ([Intel XE#2893])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][305] ([Intel XE#1489]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][306] ([Intel XE#1489]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][307], [SKIP][308]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
    - shard-lnl:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([Intel XE#2893])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][311], [SKIP][312]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#2387])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#1122])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][317] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][318] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][319], [SKIP][320]) ([Intel XE#2850] / [Intel XE#929]) +5 other tests ( 2 skip )
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_psr@pr-basic.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> ([SKIP][321], [SKIP][322]) ([Intel XE#1406])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_psr@pr-cursor-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][323] ([Intel XE#1406])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([Intel XE#2234] / [Intel XE#2850]) +4 other tests ( 2 skip )
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][326], [SKIP][327]) ([Intel XE#2414])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][328], [SKIP][329]) ([Intel XE#2939])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-lnl:          NOTRUN -> [SKIP][330] ([Intel XE#3414] / [Intel XE#3904])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][331], [SKIP][332]) ([Intel XE#3414] / [Intel XE#3904])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][333] -> ([FAIL][334], [FAIL][335]) ([Intel XE#2883]) +2 other tests ( 2 fail )
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_setmode@basic.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][336] -> ([FAIL][337], [PASS][338]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][339] -> ([PASS][340], [SKIP][341]) ([Intel XE#1435])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg2-set2:     [PASS][342] -> ([SKIP][343], [PASS][344]) ([Intel XE#455]) +1 other test ( 1 pass, 1 skip )
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][345] -> [FAIL][346] ([Intel XE#899])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][347], [SKIP][348]) ([Intel XE#1499])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_vrr@flip-basic-fastset.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][349] -> [SKIP][350] ([Intel XE#455])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_vrr@negative-basic.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][351] ([Intel XE#1499])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> ([SKIP][352], [SKIP][353]) ([Intel XE#756])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_writeback@writeback-check-output.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][354] ([Intel XE#756])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][355], [SKIP][356]) ([Intel XE#1091] / [Intel XE#2849])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> ([SKIP][357], [SKIP][358]) ([Intel XE#1091] / [Intel XE#2849])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][359] -> ([FAIL][360], [PASS][361]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][362], [SKIP][363]) ([Intel XE#1126])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-lnl:          NOTRUN -> ([SKIP][364], [SKIP][365]) ([Intel XE#2905])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-extended.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][366], [SKIP][367]) ([Intel XE#2905] / [Intel XE#3889])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-lnl:          NOTRUN -> [SKIP][368] ([Intel XE#2905])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#2905]) +5 other tests ( 2 skip )
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> ([SKIP][371], [SKIP][372]) ([Intel XE#2905]) +7 other tests ( 2 skip )
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@xe_eudebug_online@resume-one.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@xe_eudebug_online@resume-one.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][373] ([Intel XE#2905]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][374] ([Intel XE#2905]) +2 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> ([SKIP][375], [SKIP][376]) ([Intel XE#4518])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][377], [SKIP][378]) ([Intel XE#4518])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][379] ([Intel XE#688])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> ([SKIP][380], [SKIP][381]) ([Intel XE#688]) +1 other test ( 2 skip )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@xe_evict@evict-large-external.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][382] -> [SKIP][383] ([Intel XE#1392]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][384], [PASS][385]) ([Intel XE#1392])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][386] ([Intel XE#1392])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][387], [SKIP][388]) ([Intel XE#2322]) +4 other tests ( 2 skip )
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][389], [SKIP][390]) ([Intel XE#1392])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][391] -> ([SKIP][392], [PASS][393]) ([Intel XE#1392]) +9 other tests ( 1 pass, 1 skip )
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][394] ([Intel XE#2322]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][395] ([Intel XE#1392])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-dg2-set2:     [PASS][396] -> ([SKIP][397], [SKIP][398]) ([Intel XE#1392])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][399], [SKIP][400]) ([Intel XE#288]) +15 other tests ( 2 skip )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][401] ([Intel XE#288]) +4 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][402] -> [DMESG-WARN][403] ([Intel XE#3876])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][404] ([Intel XE#560])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][405], [SKIP][406]) ([Intel XE#378])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_module_load@force-load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][407] ([Intel XE#2248])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][408] ([Intel XE#2541] / [Intel XE#3573])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][409], [SKIP][410]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test ( 2 skip )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@xe_oa@syncs-userptr-wait.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][411], [SKIP][412]) ([Intel XE#2541] / [Intel XE#3573]) +3 other tests ( 2 skip )
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][413] ([Intel XE#2427])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][414] ([Intel XE#2284] / [Intel XE#366])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> ([SKIP][415], [SKIP][416]) ([Intel XE#2284])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][417], [SKIP][418]) ([Intel XE#2284])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [PASS][419] -> ([INCOMPLETE][420], [PASS][421]) ([Intel XE#2594])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][422] -> ([PASS][423], [ABORT][424]) ([Intel XE#1794])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@xe_pm@s4-basic.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@xe_pm@s4-basic.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][425] ([Intel XE#944])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> ([SKIP][426], [SKIP][427]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][428], [SKIP][429]) ([Intel XE#944]) +2 other tests ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][430] ([Intel XE#944]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> ([SKIP][431], [SKIP][432]) ([Intel XE#4130])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][433], [SKIP][434]) ([Intel XE#4130])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-lnl:          NOTRUN -> ([SKIP][435], [SKIP][436]) ([Intel XE#4130])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> ([SKIP][437], [SKIP][438]) ([Intel XE#4273])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2191]) -> ([PASS][440], [PASS][441])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][442] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][443], [PASS][444])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][445] ([Intel XE#3862]) -> ([PASS][446], [PASS][447]) +1 other test ( 2 pass )
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][448] ([Intel XE#2291]) -> ([PASS][449], [PASS][450]) +3 other tests ( 2 pass )
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#309]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#309]) -> ([PASS][454], [PASS][455])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-bmg:          [INCOMPLETE][456] ([Intel XE#3226]) -> ([PASS][457], [PASS][458]) +1 other test ( 2 pass )
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][459] ([Intel XE#3009]) -> [PASS][460]
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#702]) -> ([PASS][462], [PASS][463])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_feature_discovery@display-2x.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][464] ([Intel XE#301]) -> ([PASS][465], [PASS][466])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#310]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#310]) -> ([PASS][470], [PASS][471]) +3 other tests ( 2 pass )
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][472] ([Intel XE#2316]) -> ([PASS][473], [PASS][474]) +5 other tests ( 2 pass )
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][475] ([Intel XE#2049]) -> [PASS][476] +1 other test pass
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][477] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][478]
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][479] ([Intel XE#4543]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#656]) -> ([PASS][482], [PASS][483]) +1 other test ( 2 pass )
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][484] ([Intel XE#1503]) -> [PASS][485]
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][486] ([Intel XE#3012]) -> ([PASS][487], [PASS][488])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-adlp:         [DMESG-WARN][489] ([Intel XE#4173]) -> [PASS][490] +1 other test pass
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#836]) -> ([PASS][492], [PASS][493])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][494] ([Intel XE#1435]) -> ([PASS][495], [PASS][496])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][497] ([Intel XE#1499]) -> ([PASS][498], [PASS][499])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451:
    - shard-dg2-set2:     [INCOMPLETE][500] -> ([PASS][501], [PASS][502]) +1 other test ( 2 pass )
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1392]) -> ([PASS][504], [PASS][505]) +1 other test ( 2 pass )
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][506] ([Intel XE#4541]) -> ([PASS][507], [PASS][508])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_oa@buffer-size.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@xe_oa@buffer-size.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#787]) -> ([SKIP][510], [SKIP][511]) ([Intel XE#455] / [Intel XE#787]) +12 other tests ( 2 skip )
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#787]) -> [SKIP][513] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][514] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([ABORT][515], [INCOMPLETE][516]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test ( 1 abort, 1 incomplete )
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][518] ([Intel XE#787]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [INCOMPLETE][519] ([Intel XE#4132]) -> ([FAIL][520], [SKIP][521]) ([Intel XE#1178] / [Intel XE#2341])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_content_protection@atomic.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][522] ([Intel XE#4132]) -> [FAIL][523] ([Intel XE#1178])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][524] ([Intel XE#1178]) -> [SKIP][525] ([Intel XE#2341])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_content_protection@legacy.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][526] ([Intel XE#2341]) -> [FAIL][527] ([Intel XE#1178])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [INCOMPLETE][528] ([Intel XE#4132]) -> [SKIP][529] ([Intel XE#455])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][530] ([Intel XE#1188]) -> ([SKIP][531], [FAIL][532]) ([Intel XE#1188] / [Intel XE#2341])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@uevent.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_content_protection@uevent.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][533] ([Intel XE#2291]) -> ([SKIP][534], [PASS][535]) ([Intel XE#2291])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#309]) -> ([PASS][537], [SKIP][538]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][539] ([i915#3804]) -> ([SKIP][540], [SKIP][541]) ([Intel XE#455] / [i915#3804])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][542] ([Intel XE#2316]) -> ([PASS][543], [SKIP][544]) ([Intel XE#2316])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][545] ([Intel XE#2316]) -> ([FAIL][546], [SKIP][547]) ([Intel XE#2316] / [Intel XE#3321])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][548] ([Intel XE#301]) -> ([FAIL][549], [SKIP][550]) ([Intel XE#301] / [Intel XE#310])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#310]) -> ([SKIP][552], [PASS][553]) ([Intel XE#310])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][554] -> ([TIMEOUT][555], [TIMEOUT][556]) ([Intel XE#1504]) +1 other test ( 2 timeout )
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][557] ([Intel XE#301]) -> ([PASS][558], [FAIL][559]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][560] ([Intel XE#4543]) -> [DMESG-FAIL][561] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][562] ([Intel XE#2311]) -> ([SKIP][563], [SKIP][564]) ([Intel XE#2311] / [Intel XE#2312]) +15 other tests ( 2 skip )
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][565] ([Intel XE#2311]) -> ([SKIP][566], [SKIP][567]) ([Intel XE#2312]) +4 other tests ( 2 skip )
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][568] ([Intel XE#2312]) -> [SKIP][569] ([Intel XE#2311])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][570] ([Intel XE#2311]) -> [SKIP][571] ([Intel XE#2312])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#656]) -> ([SKIP][573], [SKIP][574]) ([Intel XE#651] / [Intel XE#656])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#651]) -> [SKIP][576] ([Intel XE#656]) +6 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][577] ([Intel XE#4141]) -> ([SKIP][578], [SKIP][579]) ([Intel XE#2312] / [Intel XE#4141]) +6 other tests ( 2 skip )
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][580] ([Intel XE#2312]) -> [SKIP][581] ([Intel XE#4141])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][582] ([Intel XE#2312]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][585] ([Intel XE#4141]) -> ([SKIP][586], [SKIP][587]) ([Intel XE#2312])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][588] ([Intel XE#2312]) -> ([SKIP][589], [SKIP][590]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][591] ([Intel XE#2312]) -> ([SKIP][592], [SKIP][593]) ([Intel XE#2311] / [Intel XE#2312]) +1 other test ( 2 skip )
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#651]) -> ([SKIP][595], [SKIP][596]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][597] ([Intel XE#2312]) -> ([SKIP][598], [SKIP][599]) ([Intel XE#2311]) +13 other tests ( 2 skip )
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#656]) -> [SKIP][601] ([Intel XE#651]) +1 other test skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#651]) -> ([SKIP][603], [SKIP][604]) ([Intel XE#651] / [Intel XE#656]) +11 other tests ( 2 skip )
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#656]) -> ([SKIP][606], [SKIP][607]) ([Intel XE#651]) +5 other tests ( 2 skip )
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#653]) -> ([SKIP][609], [SKIP][610]) ([Intel XE#656])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][611] ([Intel XE#2312]) -> ([SKIP][612], [SKIP][613]) ([Intel XE#2313]) +12 other tests ( 2 skip )
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][614] ([Intel XE#2313]) -> [SKIP][615] ([Intel XE#2312]) +2 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#656]) -> [SKIP][617] ([Intel XE#653]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][618] ([Intel XE#2313]) -> ([SKIP][619], [SKIP][620]) ([Intel XE#2312] / [Intel XE#2313]) +13 other tests ( 2 skip )
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#653]) -> ([SKIP][622], [SKIP][623]) ([Intel XE#653] / [Intel XE#656]) +14 other tests ( 2 skip )
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#4439]) -> ([SKIP][625], [SKIP][626]) ([Intel XE#1158] / [Intel XE#4439])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          [SKIP][627] ([Intel XE#4439]) -> ([SKIP][628], [SKIP][629]) ([Intel XE#2350] / [Intel XE#4439])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][630] ([Intel XE#2312]) -> ([SKIP][631], [SKIP][632]) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#656]) -> ([SKIP][634], [SKIP][635]) ([Intel XE#653]) +5 other tests ( 2 skip )
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][636] ([Intel XE#2313]) -> ([SKIP][637], [SKIP][638]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][639] ([Intel XE#2312]) -> [SKIP][640] ([Intel XE#2313]) +2 other tests skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#653]) -> [SKIP][642] ([Intel XE#656]) +6 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][643] ([Intel XE#1503]) -> ([PASS][644], [SKIP][645]) ([Intel XE#1503])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#4596]) -> ([SKIP][647], [PASS][648]) ([Intel XE#4596])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#455]) -> ([SKIP][650], [SKIP][651]) ([Intel XE#455] / [Intel XE#4596])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][652] ([Intel XE#4596]) -> [SKIP][653] ([Intel XE#2493])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][654] ([Intel XE#4596]) -> ([SKIP][655], [SKIP][656]) ([Intel XE#455])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-yf.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][657] ([Intel XE#2705] / [Intel XE#4540]) -> ([ABORT][658], [ABORT][659]) ([Intel XE#4540])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][660] ([Intel XE#2029]) -> ([FAIL][661], [PASS][662]) ([Intel XE#2029])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [FAIL][663] ([Intel XE#4570]) -> ([SKIP][664], [FAIL][665]) ([Intel XE#2893] / [Intel XE#4570] / [Intel XE#4608]) +7 other tests ( 1 fail, 1 skip )
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          [FAIL][666] ([Intel XE#4570]) -> ([SKIP][667], [FAIL][668]) ([Intel XE#4570] / [Intel XE#4608]) +15 other tests ( 1 fail, 1 skip )
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [FAIL][669] ([Intel XE#4570]) -> [SKIP][670] ([Intel XE#2893] / [Intel XE#4608])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          [FAIL][671] ([Intel XE#4570]) -> [SKIP][672] ([Intel XE#4608]) +1 other test skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][673] ([Intel XE#4568]) -> ([SKIP][674], [FAIL][675]) ([Intel XE#4568] / [Intel XE#4609]) +12 other tests ( 1 fail, 1 skip )
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [FAIL][676] ([Intel XE#4568]) -> [SKIP][677] ([Intel XE#1406])
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          [FAIL][678] ([Intel XE#4568]) -> [SKIP][679] ([Intel XE#4609])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms@edp-1.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          [FAIL][680] ([Intel XE#4568]) -> ([SKIP][681], [FAIL][682]) ([Intel XE#1406] / [Intel XE#4568]) +12 other tests ( 1 fail, 1 skip )
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][683] ([Intel XE#1729]) -> [SKIP][684] ([Intel XE#362])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#1500]) -> ([SKIP][686], [SKIP][687]) ([Intel XE#362])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][688] ([Intel XE#771]) -> [FAIL][689] ([Intel XE#899]) +2 other tests fail
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][690] ([Intel XE#2705] / [Intel XE#4540]) -> ([ABORT][691], [PASS][692]) ([Intel XE#2705] / [Intel XE#4540])
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@testdisplay.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@testdisplay.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@testdisplay.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-lnl:          [ABORT][693] ([Intel XE#4623]) -> ([PASS][694], [ABORT][695]) ([Intel XE#4623])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][696] ([Intel XE#1794]) -> ([ABORT][697], [PASS][698]) ([Intel XE#1794])
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4623
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8292 -> IGTPW_12876
  * Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -> xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda

  IGTPW_12876: 45114cdc24c9ec099c83defbdfa144e7b53df42b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8292: 8292
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54a9f4f34d476d2f3d7
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811d8f3f249392c5ceda

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/index.html

--===============3823844891355622107==
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
<tr><td><b>Series:</b></td><td>lib/i915/fbc: update fbc support based on ps=
r mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146845/">https://patchwork.freedesktop.org/series/146845/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12876/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8292_FULL -&gt; XEIGTPW_12876_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12876_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12876_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
876_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-=
crc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_vblank@ts-continuation-modeset-rpm.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2876/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-d=
g2-466/igt@kms_vblank@ts-continuation-modeset-rpm.html">INCOMPLETE</a>) +1 =
other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@srm:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html">INCOMPLETE</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sha=
rd-bmg-2/igt@kms_content_protection@srm.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_content_p=
rotection@srm.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 1 fail, 1=
 incomplete )</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12876_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-6/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-=
1/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-o=
verflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-o=
verflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12876/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
10">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12876/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotat=
e-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotat=
e-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12876/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
124">Intel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12876/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_bw@connected-linear-tiling=
-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled=
-mtl-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +168 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-t=
iled-gen12-mc-ccs@pipe-d-hdmi-a-2.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-prima=
ry-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
56 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_ccs@crc-primary-rot=
ation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180=
-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@crc-sprit=
e-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876=
/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPL=
ETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +8 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html=
">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_ccs@random-=
ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe=
-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-=
b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/441=
6">Intel XE#4416</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_chamelium_color@degamma.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>=
)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_chamelium_color@degamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_chamelium_frames@vga-frame-=
dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-bmg-4/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">I=
ntel XE#2252</a>) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-afte=
r-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12876/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernat=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_content_protection@atomic=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#=
1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_content_protection@atomic@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12876/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_cursor_crc@cursor-random-51=
2x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12876/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-5=
12x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
1">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-6=
4x21.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12876/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
9">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sha=
rd-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE=
#2291</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12876/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-at=
omic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2291">Intel XE#2291</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-leg=
acy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/309">Intel XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12876/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#15=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
6/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/i=
gt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt=
@kms_dp_aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#=
3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">I=
ntel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
6/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/i=
gt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12876/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +10 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
876/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-b=
mg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard=
-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sha=
rd-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_fea=
ture_discovery@display-2x.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_feature_discovery@display-3=
x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12876/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel X=
E#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_feature_discovery@psr2.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
6/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
876/shard-dg2-433/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12876/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#14=
21</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2876/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +5 other tests ( 1 pass, 1 skip )</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876=
/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_flip@2x-dpms-vs-vblank-race-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modese=
t-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@ac-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-=
hang.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">I=
ntel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-v=
s-hang.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310=
">Intel XE#310</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>) +8 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-=
bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2876/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html">INCOMPLETE</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@absolute-wf_vblank@a-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12876/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"=
>Intel XE#3321</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interru=
ptible@a-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible@a-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests ( 1 fail, 1 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +5 other tests ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE=
#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2=
-464/igt@kms_flip@flip-vs-suspend.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@flip-vs-=
suspend.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi=
-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/s=
hard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@k=
ms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other test=
s ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-=
4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@p=
ipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-32bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">In=
tel XE#2380</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_flip_scaled_crc@fl=
ip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1=
745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@k=
ms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-x-to-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@p=
ipe-d-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmes=
g-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +=
3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-r=
gb565-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb56=
5-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-onoff.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-msflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other test=
s ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-msflip-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE=
#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"=
>Intel XE#656</a>) +4 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_trac=
king@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +4 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Int=
el XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/=
igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-=
bmg-1/igt@kms_hdr@static-toggle-suspend.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_hdr@stati=
c-toggle-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +2 other tests ( 1 pass, 1 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_invalid_mode@clock-too-high=
@pipe-a-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12876/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-=
edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1450">Intel XE#1450</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_invalid_mode@clock-too-high=
@pipe-c-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12876/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-=
edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/=
shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt=
@kms_joiner@basic-force-big-joiner.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sha=
rd-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_plane_cursor@viewport.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-dg2-432/igt@kms_plane_cursor@viewport.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard=
-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_plane_m=
ultiple@2x-tiling-x.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-s=
rc-size@pipe-a-dp-2.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-m=
ax-src-size@pipe-a-dp-2.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-s=
rc-size@pipe-a-hdmi-a-2.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-ma=
x-src-size@pipe-a-hdmi-a-2.html">ABORT</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_plane_scaling@planes-unity-=
scaling-downscale-factor-0-5@pipe-a.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_pm_backlight@fade.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/s=
hard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other=
 test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sha=
rd-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-u=
pdate-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12876/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1489">Intel XE#1489</a>) +3 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-upd=
ate-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/289=
3">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-up=
date-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
6/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
876/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_psr@pr-basic.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-=
dg2-432/igt@kms_psr@pr-basic.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_psr@pr-cursor-render.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/=
shard-lnl-4/igt@kms_psr@pr-cursor-render.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_psr@pr-primary-page-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shar=
d-bmg-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>=
) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@k=
ms_setmode@basic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard=
-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@kms_setmode=
@basic@pipe-b-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests ( 1 fail, =
1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sha=
rd-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_set=
mode@clone-exclusive-crtc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/s=
hard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt=
@kms_setmode@clone-exclusive-crtc.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test=
 ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_vrr@flip-basic-fastset.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
6/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-46=
4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_writeback@writeback-check-o=
utput.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-bmg-3/igt@kms_writeback@writeback-check-output.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">=
Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_writeback@writeback-fb-id-=
xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12876/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unb=
ind-each-numvfs-all.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbin=
d-each-numvfs-all.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
876/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg=
-1/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>=
) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-=
0xfd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">I=
ntel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-extend=
ed.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel=
 XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-si=
gint-client.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-vm-dest=
roy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_eudebug_online@interrupt-o=
ther-debuggable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_eudebug_online@interrupt-other-d=
ebuggable.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@xe_eudebug_online@resume-one.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
876/shard-bmg-7/igt@xe_eudebug_online@resume-one.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_eudebug_online@single-step-=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@xe_eudebug_online@writes-caching=
-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>=
)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2876/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@xe_evict@evict-beng-large-extern=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@xe_evict@evict-large-external.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2876/shard-lnl-4/igt@xe_evict@evict-large-external.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basi=
c@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
2">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_exec_basic@multigpu-ma=
ny-execqueues-many-vm-userptr.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel =
XE#2322</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mm=
ap.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1392">Intel XE#1392</a>) +9 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bi=
ndexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@xe_exec_basic@multigpu-once-userptr-rebind.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-rebind.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876=
/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_exec_fault_mode@once-userp=
tr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-=
invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@xe_exec_fault_mode@twice-binde=
xecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebin=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_media_fill@media-fill.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
60">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_module_load@force-load.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@xe_oa@syncs-userptr-wait.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
6/shard-dg2-464/igt@xe_oa@syncs-userptr-wait.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel=
 XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4501">Intel XE#4501</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_oa@whitelisted-registers-u=
serspace-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspa=
ce-config.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sh=
ard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard=
-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-=
8/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_pm@s3-vm-bin=
d-prefetch.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@xe_pm=
@s4-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12876/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">In=
tel XE#944</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe_query@multigpu-query-oa-uni=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@xe_sriov_auto_provisioning@self=
config-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_sriov_auto_=
provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@xe_sriov_auto_provisioning@self=
config-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sh=
ard-bmg-1/igt@xe_sriov_flr@flr-twice.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_bw@connected-linear-=
tiling-2-displays-2560x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_bw@connected-linea=
r-tiling-2-displays-2560x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_bw@connect=
ed-linear-tiling-2-displays-3840x2160p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_bw@connect=
ed-linear-tiling-2-displays-3840x2160p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3862">Intel XE#3862</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
ccs.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cursor_legacy@2x-n=
onblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_cursor_l=
egacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/=
igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3226">Intel XE#3226</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-bmg-3/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a>=
) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bm=
g-1/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Inte=
l XE#702</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-dg2-466/igt@kms_feature_discovery@display-2x.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-d=
g2-432/igt@kms_feature_discovery@display-2x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ab-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-interrupti=
ble.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_flip@2x-single-buffer-f=
lip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_flip@2x-single-buffer-=
flip-vs-dpms-off-vs-modeset.html">PASS</a>) +5 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@blocking-absolut=
e-wf_vblank@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_flip@fl=
ip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-x-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_flip_tiling@=
flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-move.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a>) +1 other test ( 2 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/s=
hard-bmg-6/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-=
joiner.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12876/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-un=
tiled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">I=
ntel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12876/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/s=
hard-dg2-432/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_setmode@invalid-clone-single-c=
rtc-stealing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-st=
ealing.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-bmg-2/igt@kms_vrr@negative-basic.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_vrr@neg=
ative-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-vram01-vram01-451x451:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xma=
jor-compressed-compfmt0-vram01-vram01-451x451.html">INCOMPLETE</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-4=
33/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-vram01-vram01-451x451.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@xe_ccs@block-copy-compresse=
d-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html">PASS=
</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@xe=
_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>=
) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shar=
d-bmg-1/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@xe_oa@buffer-size.html"=
>PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_ccs@bad-rotati=
on-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_ccs@ccs-on-a=
nother-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sh=
ard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.=
html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-=
hdmi-a-6.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1=
 other test ( 1 abort, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">In=
tel XE#4132</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12876/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg=
-4/igt@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4132">Intel XE#4132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_content_protection@atomic@pipe=
-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Int=
el XE#4132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12876/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt=
@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-at=
omic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_cursor_l=
egacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/=
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3804">i915#3804</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-of=
f-vs-modeset-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-o=
ff-vs-modeset-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-=
modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_flip@2x-single-buffer=
-flip-vs-dpms-off-vs-modeset.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_flip@2x-single-buf=
fer-flip-vs-dpms-off-vs-modeset.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">I=
NCOMPLETE</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">T=
IMEOUT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
6/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">In=
tel XE#1504</a>) +1 other test ( 2 timeout )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
d-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-433/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible@d-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_flip@flip-vs-e=
xpired-vblank-interruptible@d-hdmi-a6.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other =
test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-adlp-8/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt=
@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"=
>Intel XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-2/igt@kms_frontbuffe=
r_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Inte=
l XE#4141</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-46=
4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a>) +13 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-8/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sh=
rfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/443=
9">Intel XE#4439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">=
Intel XE#1158</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4439">Intel XE#4439</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439"=
>Intel XE#4439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12876/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
76/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel =
XE#2350</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-435/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
 +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_frontbuffer_t=
racking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#15=
03</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2876/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-bmg-4/igt@kms_h=
dr@static-toggle-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12876/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2=
-466/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-4=
66/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE=
#2493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12876/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-d=
g2-463/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705=
">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4540">Intel XE#4540</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-m=
ax-src-size.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12876/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.h=
tml">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/sh=
ard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-3/igt@kms_pm_dc@deep-pkgc=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4570">Intel XE#4570</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@kms_psr2_sf@fbc=
-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-4/igt@k=
ms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893"=
>Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4570">Intel XE#4570</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +7 other tests ( 1 fail, 1 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt@k=
ms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp=
-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12876/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-=
exceed-fully-sf@pipe-b-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1=
5 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-contin=
uous-sf.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4570">Intel XE#4570</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overl=
ay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-contin=
uous-sf@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-2/igt@kms_psr2_sf@f=
bc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#=
4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">I=
ntel XE#4568</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12876/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/s=
hard-lnl-1/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#456=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609=
">Intel XE#4609</a>) +12 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/s=
hard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms@edp-1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4=
568</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2876/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms@edp-1.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Int=
el XE#4568</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12876/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard=
-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Inte=
l XE#4568</a>) +12 other tests ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12876/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12876/shard-dg2-463/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12876/shard-dg2-464/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12876/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel=
 XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@testdisplay.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#=
4540</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-dg2-435/igt@testdisplay.html">ABORT</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-dg2-466/igt@testdisplay.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-w=
ait_for_lmem_ready.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4623">Intel XE#4623</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-6/igt@xe_fault_inje=
ction@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-7/igt=
@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">A=
BORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
623">Intel XE#4623</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12876/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12876/shard-lnl-1/igt@x=
e_pm@s4-vm-bind-unbind-all.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8292 -&gt; IGTPW_12876</li>
<li>Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -&gt; xe-2876-e=
b7714c3b05163fd19bc811d8f3f249392c5ceda</li>
</ul>
<p>IGTPW_12876: 45114cdc24c9ec099c83defbdfa144e7b53df42b @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8292: 8292<br />
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54=
a9f4f34d476d2f3d7<br />
  xe-2876-eb7714c3b05163fd19bc811d8f3f249392c5ceda: eb7714c3b05163fd19bc811=
d8f3f249392c5ceda</p>

</body>
</html>

--===============3823844891355622107==--
