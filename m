Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3677AC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 19:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9567010E11B;
	Sun,  6 Apr 2025 19:06:47 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C3010E059;
 Sun,  6 Apr 2025 19:06:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3213303101072587600=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/intel=5Fsysfs?=
 =?utf-8?q?=5Fdebugfs=3A_Unify_sysfs_and_debugfs_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 19:06:46 -0000
Message-ID: <174396640623.41104.11669718652239150173@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328101930.231985-1-peter.senna@linux.intel.com>
In-Reply-To: <20250328101930.231985-1-peter.senna@linux.intel.com>
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

--===============3213303101072587600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/intel_sysfs_debugfs: Unify sysfs and debugfs testing
URL   : https://patchwork.freedesktop.org/series/146940/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8292_FULL -> XEIGTPW_12874_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12874_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12874_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12874_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_interruptible@legacy-pageflip:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][1], [PASS][2])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_atomic_interruptible@legacy-pageflip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_atomic_interruptible@legacy-pageflip.html

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2.html

  
#### Warnings ####

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][4] ([Intel XE#1397] / [Intel XE#1745]) -> ([ABORT][5], [SKIP][6]) ([Intel XE#1397] / [Intel XE#1745])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [SKIP][7] ([Intel XE#1397]) -> ([SKIP][8], [ABORT][9]) ([Intel XE#1397])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12874_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][10] -> ([PASS][11], [FAIL][12]) ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> ([PASS][13], [FAIL][14]) ([Intel XE#827])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][15] -> ([FAIL][16], [PASS][17]) ([Intel XE#3719] / [Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][18] -> ([PASS][19], [INCOMPLETE][20]) ([Intel XE#2613]) +1 other test ( 1 incomplete, 1 pass )
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#3908]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-bmg:          [PASS][23] -> ([INCOMPLETE][24], [PASS][25]) ([Intel XE#3225])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#316]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2327])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#2327])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#607])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#610])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#610])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][33], [SKIP][34]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][41] -> ([SKIP][42], [SKIP][43]) ([Intel XE#2191])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [PASS][44] -> ([PASS][45], [SKIP][46]) ([Intel XE#2191]) +1 other test ( 1 pass, 1 skip )
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2314] / [Intel XE#2894])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2191]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2191])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][50], [SKIP][51]) ([Intel XE#2191])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#787]) +183 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2887]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][59] -> ([PASS][60], [INCOMPLETE][61]) ([Intel XE#3862])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][62] -> ([PASS][63], [INCOMPLETE][64]) ([Intel XE#3862])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][65] ([Intel XE#3862])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#787]) +50 other tests ( 2 skip )
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][68], [SKIP][69]) ([Intel XE#3432])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#2907])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][74], [INCOMPLETE][75]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2887]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][77] -> ([PASS][78], [INCOMPLETE][79]) ([Intel XE#2705] / [Intel XE#4212])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][80] -> ([INCOMPLETE][81], [PASS][82]) ([Intel XE#4212])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#4418])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#4417]) +3 other tests ( 2 skip )
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#4416]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([Intel XE#2325])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2325])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#373]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#373]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2252]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#373]) +1 other test ( 2 skip )
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> ([SKIP][96], [SKIP][97]) ([Intel XE#373])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> ([SKIP][98], [SKIP][99]) ([Intel XE#2252]) +1 other test ( 2 skip )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][100], [FAIL][101]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_content_protection@atomic.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#307])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2390])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][104], [FAIL][105]) ([Intel XE#1178])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> ([SKIP][106], [SKIP][107]) ([Intel XE#2320])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#2321])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#308])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-lnl:          NOTRUN -> ([SKIP][111], [SKIP][112]) ([Intel XE#2321])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2321])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2320]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1424])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][116] -> ([PASS][117], [SKIP][118]) ([Intel XE#309]) +4 other tests ( 1 pass, 1 skip )
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> ([SKIP][119], [SKIP][120]) ([Intel XE#2291])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#309]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#309])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][124] -> [SKIP][125] ([Intel XE#2291])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([Intel XE#309])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][128] -> ([SKIP][129], [PASS][130]) ([Intel XE#2291])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          NOTRUN -> ([PASS][131], [SKIP][132]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-dg2-set2:     NOTRUN -> ([PASS][133], [SKIP][134]) ([Intel XE#309])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][135] -> ([PASS][136], [FAIL][137]) ([Intel XE#1475])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#323])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][139], [PASS][140]) ([Intel XE#3226]) +1 other test ( 1 incomplete, 1 pass )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][141], [SKIP][142]) ([Intel XE#1508])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [PASS][143] -> ([PASS][144], [SKIP][145]) ([Intel XE#4302])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#455]) +9 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2244])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> ([SKIP][148], [SKIP][149]) ([Intel XE#776])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_fbcon_fbt@psr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][150], [SKIP][151]) ([Intel XE#776])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_fbcon_fbt@psr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2373])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#2374])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_feature_discovery@psr2.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#1135])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_feature_discovery@psr2.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#310])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][158] -> ([PASS][159], [SKIP][160]) ([Intel XE#310]) +7 other tests ( 1 pass, 1 skip )
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1421]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> ([PASS][162], [SKIP][163]) ([Intel XE#310])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][164] -> ([SKIP][165], [SKIP][166]) ([Intel XE#2316]) +2 other tests ( 2 skip )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          NOTRUN -> ([PASS][167], [SKIP][168]) ([Intel XE#2316]) +3 other tests ( 1 pass, 1 skip )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][169] -> [FAIL][170] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][171] -> [FAIL][172] ([Intel XE#301]) +8 other tests fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][173], [PASS][174]) ([Intel XE#3321]) +5 other tests ( 1 fail, 1 pass )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][175] ([Intel XE#3321]) +3 other tests fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][176] -> [SKIP][177] ([Intel XE#310]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-modeset.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2316])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][179] -> ([PASS][180], [SKIP][181]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [PASS][182] -> ([PASS][183], [FAIL][184]) ([Intel XE#2882]) +7 other tests ( 1 fail, 1 pass )
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][185] -> ([PASS][186], [FAIL][187]) ([Intel XE#301])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][188] -> ([FAIL][189], [PASS][190]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][191] -> ([FAIL][192], [PASS][193]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][194] -> ([INCOMPLETE][195], [INCOMPLETE][196]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 2 incomplete )
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][197] -> ([INCOMPLETE][198], [PASS][199]) ([Intel XE#2049] / [Intel XE#2597]) +2 other tests ( 1 incomplete, 1 pass )
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][200], [PASS][201]) ([Intel XE#2049] / [Intel XE#2597])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> ([FAIL][202], [PASS][203]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][204] -> [FAIL][205] ([Intel XE#886]) +1 other test fail
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][206], [SKIP][207]) ([Intel XE#2293] / [Intel XE#2380])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][208], [SKIP][209]) ([Intel XE#2293])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2293]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][212], [SKIP][213]) ([Intel XE#1401] / [Intel XE#1745])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][214], [SKIP][215]) ([Intel XE#1401])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#651]) +5 other tests ( 2 skip )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][218], [SKIP][219]) ([Intel XE#2311]) +2 other tests ( 2 skip )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#651])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][221], [SKIP][222]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#656]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#2311]) +12 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [PASS][225] -> [SKIP][226] ([Intel XE#656]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [PASS][227] -> ([SKIP][228], [SKIP][229]) ([Intel XE#656]) +1 other test ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#4141])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][232], [PASS][233]) ([Intel XE#656])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][234], [SKIP][235]) ([Intel XE#2312] / [Intel XE#4141]) +2 other tests ( 2 skip )
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][236] -> ([PASS][237], [SKIP][238]) ([Intel XE#656]) +9 other tests ( 1 pass, 1 skip )
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#4141]) +7 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#2312]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#651]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][242], [SKIP][243]) ([Intel XE#651]) +2 other tests ( 2 skip )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#653]) +12 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#656]) +6 other tests ( 2 skip )
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#653] / [Intel XE#656]) +1 other test ( 2 skip )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][253], [SKIP][254]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][255], [SKIP][256]) ([Intel XE#653]) +7 other tests ( 2 skip )
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#2313]) +9 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#656]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][259], [SKIP][260]) ([Intel XE#455]) +3 other tests ( 2 skip )
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_hdr@brightness-with-hdr.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> ([SKIP][261], [SKIP][262]) ([Intel XE#3374] / [Intel XE#3544])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][263] -> ([SKIP][264], [SKIP][265]) ([Intel XE#455]) +1 other test ( 2 skip )
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#1450]) +1 other test ( 2 skip )
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#1450] / [Intel XE#2568]) +1 other test ( 2 skip )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][270] ([Intel XE#616]) +3 other tests fail
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][271] -> ([PASS][272], [SKIP][273]) ([Intel XE#4596]) +1 other test ( 1 pass, 1 skip )
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     [PASS][274] -> ([SKIP][275], [SKIP][276]) ([Intel XE#309])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [PASS][277] -> ([PASS][278], [SKIP][279]) ([Intel XE#2685] / [Intel XE#3307])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][280] ([Intel XE#4212])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][281] ([Intel XE#2763]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][282] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> ([SKIP][285], [SKIP][286]) ([Intel XE#2763]) +9 other tests ( 2 skip )
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][287] ([Intel XE#870]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][288] ([Intel XE#870])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#1122])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][290] ([Intel XE#2392])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][291] ([Intel XE#1430])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#908])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][294] -> ([SKIP][295], [PASS][296]) ([Intel XE#836]) +1 other test ( 1 pass, 1 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][297] ([Intel XE#2893]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][298] ([Intel XE#1489]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][299], [SKIP][300]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#1489]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][302], [SKIP][303]) ([Intel XE#1489])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> ([SKIP][304], [SKIP][305]) ([Intel XE#2387])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][306], [SKIP][307]) ([Intel XE#1122])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][308] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][309] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][310], [SKIP][311]) ([Intel XE#2850] / [Intel XE#929]) +3 other tests ( 2 skip )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_psr@pr-basic.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> ([SKIP][312], [SKIP][313]) ([Intel XE#1406])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_psr@pr-cursor-render.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> ([SKIP][314], [SKIP][315]) ([Intel XE#2234] / [Intel XE#2850]) +2 other tests ( 2 skip )
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][316] ([Intel XE#2414])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][317] ([Intel XE#2939])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-bmg:          NOTRUN -> ([PASS][318], [INCOMPLETE][319]) ([Intel XE#4622])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> ([SKIP][320], [SKIP][321]) ([Intel XE#3414] / [Intel XE#3904])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sequence@get-busy:
    - shard-adlp:         [PASS][322] -> [DMESG-WARN][323] ([Intel XE#4173]) +5 other tests dmesg-warn
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_sequence@get-busy.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-6/igt@kms_sequence@get-busy.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][324] -> ([FAIL][325], [PASS][326]) ([Intel XE#2883]) +6 other tests ( 1 fail, 1 pass )
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_setmode@basic.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_setmode@basic.html
    - shard-dg2-set2:     [PASS][327] -> ([FAIL][328], [PASS][329]) ([Intel XE#2883])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_setmode@basic.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_setmode@basic.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][330] -> [FAIL][331] ([Intel XE#2883]) +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][332] -> ([PASS][333], [SKIP][334]) ([Intel XE#1435])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][335] -> ([PASS][336], [FAIL][337]) ([Intel XE#771] / [Intel XE#899])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][338] ([Intel XE#899])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][339] -> [DMESG-WARN][340] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][341] -> ([FAIL][342], [PASS][343]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][344] ([Intel XE#1499]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> ([SKIP][345], [SKIP][346]) ([Intel XE#756])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_writeback@writeback-check-output.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][347] ([Intel XE#756])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][348], [SKIP][349]) ([Intel XE#1091] / [Intel XE#2849])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> ([SKIP][350], [SKIP][351]) ([Intel XE#1091] / [Intel XE#2849])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][352] ([Intel XE#1126])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][353], [SKIP][354]) ([Intel XE#2905] / [Intel XE#3889])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-lnl:          NOTRUN -> ([SKIP][355], [SKIP][356]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][357] ([Intel XE#2905]) +6 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-bmg:          NOTRUN -> ([SKIP][358], [SKIP][359]) ([Intel XE#2905]) +4 other tests ( 2 skip )
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#2905]) +5 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> ([SKIP][361], [SKIP][362]) ([Intel XE#4518])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][363], [SKIP][364]) ([Intel XE#4518])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][365] ([Intel XE#688]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][366], [SKIP][367]) ([Intel XE#2322]) +1 other test ( 2 skip )
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][368] -> ([PASS][369], [SKIP][370]) ([Intel XE#1392]) +8 other tests ( 1 pass, 1 skip )
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][371] ([Intel XE#1392])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][372] ([Intel XE#2322]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][373] -> [SKIP][374] ([Intel XE#1392])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][375], [SKIP][376]) ([Intel XE#288]) +9 other tests ( 2 skip )
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][377] ([Intel XE#288]) +9 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][378], [SKIP][379]) ([Intel XE#2905]) +2 other tests ( 2 skip )
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][380] ([Intel XE#560])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][381], [SKIP][382]) ([Intel XE#378])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_module_load@force-load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][383] ([Intel XE#2248])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][384] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][385], [SKIP][386]) ([Intel XE#2541] / [Intel XE#3573])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_oa@polling.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_oa@polling.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][387], [SKIP][388]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_oa@syncs-syncobj-none.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][389] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> ([SKIP][390], [SKIP][391]) ([Intel XE#2427])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_peer2peer@write.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][392], [SKIP][393]) ([Intel XE#2284] / [Intel XE#366])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> ([SKIP][394], [SKIP][395]) ([Intel XE#2284])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][396], [SKIP][397]) ([Intel XE#2284])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][398] ([Intel XE#584])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][399] -> [ABORT][400] ([Intel XE#1794])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][401] -> ([ABORT][402], [PASS][403]) ([Intel XE#1794]) +1 other test ( 1 abort, 1 pass )
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][404] -> [ABORT][405] ([Intel XE#1794])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> ([SKIP][406], [SKIP][407]) ([Intel XE#944])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> ([SKIP][408], [SKIP][409]) ([Intel XE#944])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][410] ([Intel XE#944]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][411] ([Intel XE#944]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> ([SKIP][412], [SKIP][413]) ([Intel XE#4130])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][414] ([Intel XE#4273])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][415] ([Intel XE#4351])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#2191]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][418] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][419], [PASS][420])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][421] ([Intel XE#3862]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][423] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][424], [PASS][425])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][426] ([Intel XE#2291]) -> ([PASS][427], [PASS][428]) +3 other tests ( 2 pass )
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#309]) -> ([PASS][430], [PASS][431]) +2 other tests ( 2 pass )
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-bmg:          [SKIP][432] ([Intel XE#2291]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-bmg:          [INCOMPLETE][434] ([Intel XE#3226]) -> [PASS][435] +1 other test pass
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][436] ([Intel XE#3009]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#702]) -> ([PASS][439], [PASS][440])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_feature_discovery@display-2x.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#310]) -> ([PASS][442], [PASS][443]) +1 other test ( 2 pass )
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][444] ([Intel XE#2316]) -> ([PASS][445], [PASS][446]) +4 other tests ( 2 pass )
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][447] ([Intel XE#301]) -> [PASS][448] +1 other test pass
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#310]) -> [PASS][450] +1 other test pass
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][451] ([Intel XE#2049]) -> [PASS][452] +1 other test pass
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][453] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][454] +1 other test pass
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][455] ([Intel XE#4543]) -> [PASS][456] +1 other test pass
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#656]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#656]) -> ([PASS][460], [PASS][461])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][462] ([Intel XE#1503]) -> ([PASS][463], [PASS][464])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-adlp:         [DMESG-WARN][465] ([Intel XE#4173]) -> [PASS][466] +1 other test pass
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#4596]) -> [PASS][468]
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#836]) -> ([PASS][470], [PASS][471])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][472] ([Intel XE#1435]) -> ([PASS][473], [PASS][474])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][475] ([Intel XE#771]) -> [PASS][476]
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][477] ([Intel XE#1499]) -> [PASS][478]
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451:
    - shard-dg2-set2:     [INCOMPLETE][479] -> [PASS][480] +1 other test pass
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0-vram01-vram01-451x451.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1392]) -> ([PASS][482], [PASS][483]) +1 other test ( 2 pass )
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][484] ([Intel XE#4541]) -> [PASS][485]
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@xe_oa@buffer-size.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][486] ([Intel XE#1794]) -> ([PASS][487], [PASS][488])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#787]) -> ([SKIP][490], [SKIP][491]) ([Intel XE#455] / [Intel XE#787]) +15 other tests ( 2 skip )
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][493] ([Intel XE#787])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#787]) -> [SKIP][495] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][496] ([Intel XE#3862]) -> ([PASS][497], [INCOMPLETE][498]) ([Intel XE#3862])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][499] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([INCOMPLETE][500], [INCOMPLETE][501]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][503], [SKIP][504]) ([Intel XE#787]) +1 other test ( 2 skip )
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#4418]) -> ([SKIP][506], [SKIP][507]) ([Intel XE#4418] / [Intel XE#4440])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [INCOMPLETE][508] ([Intel XE#4132]) -> ([FAIL][509], [SKIP][510]) ([Intel XE#1178] / [Intel XE#2341])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_content_protection@atomic.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][511] ([Intel XE#1178]) -> ([FAIL][512], [SKIP][513]) ([Intel XE#1178] / [Intel XE#455])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [FAIL][514] ([Intel XE#1178]) -> ([SKIP][515], [FAIL][516]) ([Intel XE#1178] / [Intel XE#2341])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][517] ([Intel XE#4132]) -> [FAIL][518] ([Intel XE#1178])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][519] ([Intel XE#2341]) -> ([FAIL][520], [FAIL][521]) ([Intel XE#1178])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [INCOMPLETE][522] -> [FAIL][523] ([Intel XE#1178]) +1 other test fail
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [INCOMPLETE][524] ([Intel XE#4132]) -> [SKIP][525] ([Intel XE#455])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][526] ([Intel XE#1188]) -> ([SKIP][527], [FAIL][528]) ([Intel XE#1188] / [Intel XE#455])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_content_protection@uevent.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_content_protection@uevent.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][529] ([Intel XE#1188]) -> ([SKIP][530], [SKIP][531]) ([Intel XE#2341])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-6/igt@kms_content_protection@uevent.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_content_protection@uevent.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#309]) -> ([PASS][533], [SKIP][534]) ([Intel XE#309])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][535] ([Intel XE#2316]) -> ([FAIL][536], [FAIL][537]) ([Intel XE#3321])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][538] ([Intel XE#301]) -> ([FAIL][539], [SKIP][540]) ([Intel XE#301] / [Intel XE#310]) +1 other test ( 1 fail, 1 skip )
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#310]) -> ([SKIP][542], [PASS][543]) ([Intel XE#310]) +2 other tests ( 1 pass, 1 skip )
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][544] ([Intel XE#2316]) -> ([PASS][545], [SKIP][546]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][547] -> [TIMEOUT][548] ([Intel XE#1504]) +1 other test timeout
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][549] ([Intel XE#4543]) -> [DMESG-FAIL][550] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][551] ([Intel XE#2311]) -> ([SKIP][552], [SKIP][553]) ([Intel XE#2312])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#656]) -> ([SKIP][555], [SKIP][556]) ([Intel XE#651] / [Intel XE#656]) +1 other test ( 2 skip )
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][557] ([Intel XE#2311]) -> [SKIP][558] ([Intel XE#2312]) +3 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][559] ([Intel XE#2311]) -> ([SKIP][560], [SKIP][561]) ([Intel XE#2311] / [Intel XE#2312]) +16 other tests ( 2 skip )
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][562] ([Intel XE#2312]) -> [SKIP][563] ([Intel XE#2311]) +3 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][564] ([Intel XE#4141]) -> ([SKIP][565], [SKIP][566]) ([Intel XE#2312] / [Intel XE#4141]) +9 other tests ( 2 skip )
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][567] ([Intel XE#2312]) -> [SKIP][568] ([Intel XE#4141])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][569] ([Intel XE#2312]) -> ([SKIP][570], [SKIP][571]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][572] ([Intel XE#2312]) -> ([SKIP][573], [SKIP][574]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][575] ([Intel XE#2312]) -> ([SKIP][576], [SKIP][577]) ([Intel XE#2311] / [Intel XE#2312])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#651]) -> [SKIP][579] ([Intel XE#656]) +2 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][580] ([Intel XE#2312]) -> ([SKIP][581], [SKIP][582]) ([Intel XE#2311]) +11 other tests ( 2 skip )
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#656]) -> [SKIP][584] ([Intel XE#651]) +4 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#651]) -> ([SKIP][586], [SKIP][587]) ([Intel XE#656])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#651]) -> ([SKIP][589], [SKIP][590]) ([Intel XE#651] / [Intel XE#656]) +18 other tests ( 2 skip )
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#656]) -> ([SKIP][592], [SKIP][593]) ([Intel XE#651]) +1 other test ( 2 skip )
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][594] ([Intel XE#2312]) -> ([SKIP][595], [SKIP][596]) ([Intel XE#2313]) +13 other tests ( 2 skip )
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][597] ([Intel XE#2313]) -> [SKIP][598] ([Intel XE#2312])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][599] ([Intel XE#2313]) -> ([SKIP][600], [SKIP][601]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#653]) -> ([SKIP][603], [SKIP][604]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#653]) -> ([SKIP][606], [SKIP][607]) ([Intel XE#653] / [Intel XE#656]) +14 other tests ( 2 skip )
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#656]) -> [SKIP][609] ([Intel XE#653]) +1 other test skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#656]) -> ([SKIP][611], [SKIP][612]) ([Intel XE#653] / [Intel XE#656])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][613] ([Intel XE#2312]) -> ([SKIP][614], [SKIP][615]) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][616] ([Intel XE#2312]) -> [SKIP][617] ([Intel XE#2313]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#656]) -> ([SKIP][619], [SKIP][620]) ([Intel XE#653]) +4 other tests ( 2 skip )
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#653]) -> [SKIP][622] ([Intel XE#656]) +3 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][623] ([Intel XE#2313]) -> ([SKIP][624], [SKIP][625]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][626] ([Intel XE#1503]) -> ([SKIP][627], [PASS][628]) ([Intel XE#1503])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][629] ([Intel XE#3012]) -> ([SKIP][630], [PASS][631]) ([Intel XE#3012])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][632] ([Intel XE#2493]) -> ([SKIP][633], [SKIP][634]) ([Intel XE#2493] / [Intel XE#4596])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][635] ([Intel XE#4596]) -> ([SKIP][636], [SKIP][637]) ([Intel XE#2493])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#4596]) -> ([SKIP][639], [SKIP][640]) ([Intel XE#455])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][641] ([Intel XE#2705] / [Intel XE#4540]) -> ([ABORT][642], [SKIP][643]) ([Intel XE#4540] / [Intel XE#455])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][644] ([Intel XE#4502] / [Intel XE#4540]) -> [ABORT][645] ([Intel XE#4540])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#1500]) -> ([SKIP][647], [SKIP][648]) ([Intel XE#1500] / [Intel XE#362])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][649] ([Intel XE#771]) -> [FAIL][650] ([Intel XE#899]) +1 other test fail
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-lnl:          [ABORT][651] ([Intel XE#4623]) -> ([PASS][652], [ABORT][653]) ([Intel XE#4623])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
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
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
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
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4622
  [Intel XE#4623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4623
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
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
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8292 -> IGTPW_12874
  * Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -> xe-2874-9447a2490a5bfe1540aa5c59ac9cd537a9574158

  IGTPW_12874: 12874
  IGT_8292: 8292
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54a9f4f34d476d2f3d7
  xe-2874-9447a2490a5bfe1540aa5c59ac9cd537a9574158: 9447a2490a5bfe1540aa5c59ac9cd537a9574158

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/index.html

--===============3213303101072587600==
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
<tr><td><b>Series:</b></td><td>tests/intel/intel_sysfs_debugfs: Unify sysfs=
 and debugfs testing</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146940/">https://patchwork.freedesktop.org/series/146940/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12874/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12874/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8292_FULL -&gt; XEIGTPW_12874_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12874_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12874_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
874_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_atomic_interruptible@legacy=
-pageflip.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_atomic_interruptible@legacy-pagef=
lip.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_atomic_interruptible@legacy-=
pageflip@pipe-a-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4t=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@k=
ms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">ABORT<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard=
-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4t=
ile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-3/i=
gt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-d=
efault-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12874/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-1=
6bpp-4tile-downscaling@pipe-a-default-mode.html">ABORT</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</=
li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12874_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12874/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12874/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3701">Intel XE#3701</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_async_flips@alternate-sync-=
async-flip-atomic@pipe-d-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_async_flips@alterna=
te-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12874/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-fl=
ip-events-atomic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_async_flips@async-flip-with-page=
-flip-events-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other test=
s ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_atomic_transition@plane-all-mode=
set-transition-fencing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_atomic_transition@plane-al=
l-modeset-transition-fencing.html">INCOMPLETE</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>) +1 other t=
est ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-tran=
sition.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12874/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modes=
et-transition.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/=
shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">INCOMPLETE</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1=
/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12874/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_big_fb@y-tiled-max-=
hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12874/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
124">Intel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_big_fb@yf-tiled-ma=
x-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-dis=
plays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840=
x2160p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displ=
ays-3840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-dis=
plays-3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled=
-mtl-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +183 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-til=
ed-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12874/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-r=
c-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180=
-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe=
-d-dp-2.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12874/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg=
-ccs@pipe-d-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-=
bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12874/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-c=
cs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12874/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.h=
tml">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-=
tiled-dg2-mc-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@crc-primary=
-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +50 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12874/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12874/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html=
">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_ccs@random-ccs-d=
ata-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_cdclk@mode-transition@pip=
e-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12874/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4417">Intel XE#4417</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
874/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
874/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-afte=
r-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12874/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernat=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-fast=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12874/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#=
2252</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_content_protection@atomic=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12874/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#=
1178</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_content_protection@dp-mst-=
lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_content_protection@lic-type=
-0@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe=
-a-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen=
-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12874/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_cursor_crc@cursor-random-51=
2x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-5=
12x170.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12874/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
1">Intel XE#2321</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64=
x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12874/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874=
/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Int=
el XE#309</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cu=
rsor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12874/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
9">Intel XE#309</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12874/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12874/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2291">Intel XE#2291</a>) +1 other test ( 1 pass, 1 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-leg=
acy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12874/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12874/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tran=
sitions.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_cursor_legacy@torture-mov=
e@pipe-a.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-=
a.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3226">Intel XE#3226</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12874/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#15=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
874/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2=
-464/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +9 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-b=
mg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard=
-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_feature_discovery@psr2.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
4/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
874/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12874/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>) +7 other tests ( 1 pass, 1 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_flip@2x-dpms-vs-vblank-race-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4=
/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpm=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs=
-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
5 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-d=
g2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/i=
gt@kms_flip@2x-plain-flip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-plain-flip.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@b-dp2.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/sh=
ard-bmg-1/igt@kms_flip@blocking-wf_vblank@b-dp2.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_f=
lip@blocking-wf_vblank@b-dp2.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +7 other tests (=
 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/sh=
ard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms=
_flip@flip-vs-expired-vblank.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12874/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
74/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"=
>Intel XE#3321</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12874/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12874/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +3 other tests ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3=
/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@flip-vs-=
suspend.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 2=
 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2874/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPL=
ETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/s=
hard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2597">Intel XE#2597</a>) +2 other tests ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-hd=
mi-a6.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12874/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-hdmi-a6.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-in=
terruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12874/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptibl=
e.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/sh=
ard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-=
4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip_scale=
d_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE=
#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-=
4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@p=
ipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_flip_scaled_crc@fl=
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
g/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@k=
ms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_frontbuffer=
_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-plflip-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p=
-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">I=
ntel XE#4141</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12874/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656=
">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_track=
ing@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE=
#4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_trackin=
g@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-6/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_frontbuffer_trac=
king@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2874/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +3 other tests ( 2 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
74/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"=
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
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/=
igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_invalid_mode@clock-too-high=
@pipe-a-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12874/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-a-=
edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1450">Intel XE#1450</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_invalid_mode@clock-too-high=
@pipe-c-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12874/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@pipe-c-=
edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard=
-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_plane_m=
ultiple@2x-tiling-4.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 other test ( 1 pass, 1=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2874/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-d=
g2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874=
/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt=
@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#330=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_plane_scaling@planes-unity-=
scaling-downscale-factor-0-5@pipe-a.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_plane_scaling@planes-upscal=
e-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">=
Intel XE#2763</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/sha=
rd-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-=
dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_pm_rpm@=
modeset-non-lpsp.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test ( 1 pass, 1 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-up=
date-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12874/shard-dg2-435/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
4/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
874/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_psr@pr-basic.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-=
dg2-463/igt@kms_psr@pr-basic.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_psr@pr-cursor-render.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/=
shard-lnl-8/igt@kms_psr@pr-cursor-render.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shar=
d-bmg-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>=
) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_rotation_crc@multiplane-rot=
ation-cropping-top.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-top.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4622">Intel XE#4622</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_rotation_crc@sprite-rotatio=
n-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12874/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-9/igt@kms_sequence@get-busy.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-6/i=
gt@kms_sequence@get-busy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@k=
ms_setmode@basic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_setmode@basic.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) +6 other tests ( 1 fail, 1 pass )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_setmode@basic.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/ig=
t@kms_setmode@basic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_setmode@basic.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">In=
tel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/s=
hard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
4/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/i=
gt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874=
/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/i=
gt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_universal_plane@cursor-fb-=
leak@pipe-b-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/s=
hard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-=
7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_writeback@writeback-check-o=
utput.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-bmg-8/igt@kms_writeback@writeback-check-output.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">=
Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_writeback@writeback-fb-id-=
xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12874/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unb=
ind-each-numvfs-all.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbin=
d-each-numvfs-all.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-si=
gint-client.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-vm-des=
troy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12874/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">I=
ntel XE#2905</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_eudebug_online@interrupt-ot=
her-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@xe_eudebug_online@writes-cachin=
g-vram-bb-sram-target-vram.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_eudebug_online@writes-c=
aching-vram-bb-sram-target-vram.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_eudebug_online@writes-caching=
-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
74/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>=
)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2874/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@xe_evict@evict-large-external.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel =
XE#2322</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12874/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-=
mmap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12874/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) +8 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12874/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_exec_fault_mode@many-execq=
ueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_exec_=
fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">I=
ntel XE#288</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@xe_exec_fault_mode@many-execqu=
eues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip-twice.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-wri=
tesip-twice.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@xe_media_fill@media-fill.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
60">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_module_load@force-load.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
74/shard-dg2-464/igt@xe_module_load@force-load.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_oa@polling.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2=
-463/igt@xe_oa@polling.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_oa@syncs-syncobj-none.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
4/shard-dg2-435/igt@xe_oa@syncs-syncobj-none.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel=
 XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@xe_oa@syncs-userptr-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-=
bmg-4/igt@xe_peer2peer@write.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/=
shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#3=
66</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/sh=
ard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard=
-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@xe_pm@s3-exec-after.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Int=
el XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-9/igt=
@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-=
2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-5/igt@xe_pm@s4-d3hot-basic=
-exec.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-2/i=
gt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycl=
es.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12874/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@xe_query@multigpu-query-gt-list=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12874/shard-bmg-4/igt@xe_query@multigpu-query-gt-list.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#9=
44</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-=
version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-lnl-3/igt@xe_sriov_auto_provisioning@self=
config-reprovision-increase-numvfs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-8/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@xe_sriov_scheduling@equal-thro=
ughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4351">Intel XE#4351</a>)</li>
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
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_bw@connected-linear-t=
iling-2-displays-2560x1440p.html">PASS</a></li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_bw@connect=
ed-linear-tiling-2-displays-3840x2160p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_bw@connect=
ed-linear-tiling-2-displays-3840x2160p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe=
-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_ccs@crc-prim=
ary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a></li>
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
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/sh=
ard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12874/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-h=
dmi-a-6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_cursor_legacy@2x-=
nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_cursor_leg=
acy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) +2 other tests =
( 2 pass )</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_cursor_legacy@2x-non=
blocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_cursor_legacy@torture-move@pipe-b.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bm=
g-7/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Inte=
l XE#702</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12874/shard-dg2-466/igt@kms_feature_discovery@display-2x.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-d=
g2-466/igt@kms_feature_discovery@display-2x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310=
">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2874/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a=
>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12874/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-of=
f-vs-modeset-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-o=
ff-vs-modeset-interruptible.html">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-=
modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_flip@2x-single-buffer-=
flip-vs-dpms-off-vs-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a6=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_flip@blocking-absolut=
e-wf_vblank@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-1/igt@kms_flip@flip-vs-susp=
end-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
43">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-cur-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer=
_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@km=
s_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#15=
03</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2874/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_h=
dr@static-toggle-dpms.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12874/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-un=
tiled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12874/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">I=
ntel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12874/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/s=
hard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_setmode@invalid-clone-single-c=
rtc-stealing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-st=
ealing.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
4/shard-bmg-2/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt=
0-vram01-vram01-451x451:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_ccs@block-copy-compressed-inc-dimension@xma=
jor-compressed-compfmt0-vram01-vram01-451x451.html">INCOMPLETE</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-43=
5/igt@xe_ccs@block-copy-compressed-inc-dimension@xmajor-compressed-compfmt0=
-vram01-vram01-451x451.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@xe=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard=
-bmg-8/igt@xe_oa@buffer-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12874/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt@x=
e_pm@s4-vm-bind-unbind-all.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_ccs@bad-rotati=
on-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hd=
mi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_ccs@bad-rot=
ation-90-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3862">Intel XE#3862</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-=
ccs.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418=
">Intel XE#4418</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12874/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2874/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">In=
tel XE#4132</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12874/shard-bmg-7/igt@kms_content_protection@atomic.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg=
-4/igt@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12874/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/s=
hard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12874/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard=
-bmg-1/igt@kms_content_protection@atomic-dpms.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4132">Intel XE#4132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_content_protection@atomic@pipe=
-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-b=
mg-2/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@srm.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shar=
d-bmg-8/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 othe=
r test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_content_protection@srm.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Int=
el XE#4132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12874/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-4=
63/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-6/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12874/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt=
@kms_content_protection@uevent.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_cursor_l=
egacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/=
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test ( 1 =
fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/310">Intel XE#310</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_flip@2x-single-buffer-f=
lip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_flip@2x-single-buffer-=
flip-vs-dpms-off-vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12874/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-adlp-4/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Int=
el XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">=
Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-mu=
ltidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) +2 other tests skip</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a>) +11 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-435/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>) +18 other tests ( 2 skip )</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-2/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +13 other tests ( 2 skip )</li>
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
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"=
>Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-432/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-433/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">In=
tel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/=
shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7/igt@kms_hdr@static-=
toggle.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12874/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-=
joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12874/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel X=
E#2493</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12874/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-4/i=
gt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12874/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-bmg-7=
/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12874/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-d=
g2-433/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"http=
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
1.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_plane_scaling@intel-m=
ax-src-size.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12874/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4540">Intel XE#4540</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4502">Intel XE#4502</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-dg2-466/igt@kms_plane_=
scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12874/shard-dg2-436/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12874/shard-dg2-463/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8292/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12874/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel=
 XE#899</a>) +1 other test fail</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-3/igt@xe_fault_inje=
ction@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12874/shard-lnl-1/igt=
@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">A=
BORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
623">Intel XE#4623</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8292 -&gt; IGTPW_12874</li>
<li>Linux: xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7 -&gt; xe-2874-9=
447a2490a5bfe1540aa5c59ac9cd537a9574158</li>
</ul>
<p>IGTPW_12874: 12874<br />
  IGT_8292: 8292<br />
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54=
a9f4f34d476d2f3d7<br />
  xe-2874-9447a2490a5bfe1540aa5c59ac9cd537a9574158: 9447a2490a5bfe1540aa5c5=
9ac9cd537a9574158</p>

</body>
</html>

--===============3213303101072587600==--
