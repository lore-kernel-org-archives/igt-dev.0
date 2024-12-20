Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B61E7718B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 10:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4272610E159;
	Fri, 20 Dec 2024 10:33:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4F910E159;
 Fri, 20 Dec 2024 10:33:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6835002032171680800=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2Cv1=2C1/2=5D_lib/igt=5Fkms=3A_Add_support_to_retrieve_async_?=
 =?utf-8?q?modifiers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Dec 2024 10:33:35 -0000
Message-ID: <173469081509.755779.3541748970813140585@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241217064413.2301301-1-santhosh.reddy.guddati@intel.com>
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

--===============6835002032171680800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v1,1/2] lib/igt_kms: Add support to retrieve async modifiers (rev2)
URL   : https://patchwork.freedesktop.org/series/142693/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8165_full -> XEIGTPW_12352_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12352_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12352_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12352_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +618 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][3] +348 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][4] -> [FAIL][5] +384 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [FAIL][6] +115 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [FAIL][7] +84 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_getfb@getfb2-handle-not-fb:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +630 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_getfb@getfb2-handle-not-fb.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_getfb@getfb2-handle-not-fb.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][10] +2 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_exec_basic@once-userptr-rebind:
    - shard-bmg:          [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@xe_exec_basic@once-userptr-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_exec_basic@once-userptr-rebind.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-bmg:          [PASS][13] -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@xe_gt_freq@freq_fixed_exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][15] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][16] ([Intel XE#2233]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#623]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          [SKIP][20] ([Intel XE#1466]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-lnl:          [FAIL][22] ([Intel XE#911]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][24] ([Intel XE#3719]) -> [FAIL][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@crc:
    - shard-bmg:          [INCOMPLETE][26] ([Intel XE#3781]) -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_async_flips@crc.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2-set2:     [INCOMPLETE][28] ([Intel XE#3781]) -> [FAIL][29] +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_async_flips@crc-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][30] ([Intel XE#873]) -> [FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html
    - shard-lnl:          [SKIP][32] ([Intel XE#873]) -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_async_flips@invalid-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][34] ([Intel XE#3768]) -> [FAIL][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-lnl:          [SKIP][36] ([Intel XE#3768]) -> [FAIL][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_async_flips@invalid-async-flip-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          [SKIP][38] ([Intel XE#664]) -> [FAIL][39] +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_async_flips@test-cursor.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          [SKIP][40] ([Intel XE#3279]) -> [FAIL][41] +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-bmg:          [SKIP][42] ([Intel XE#2385]) -> [FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][44] ([Intel XE#2370]) -> [FAIL][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][46] ([Intel XE#2327]) -> [FAIL][47] +18 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][48] ([Intel XE#3658]) -> [FAIL][49] +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][50] ([Intel XE#1407]) -> [FAIL][51] +25 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          [DMESG-WARN][52] ([Intel XE#1725]) -> [FAIL][53] +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][54] ([Intel XE#316]) -> [FAIL][55] +23 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][56] ([Intel XE#1124]) -> [FAIL][57] +59 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][58] ([Intel XE#1477]) -> [FAIL][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][60] ([Intel XE#610]) -> [FAIL][61] +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-lnl:          [SKIP][62] ([Intel XE#1428]) -> [FAIL][63] +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][64] ([Intel XE#1124]) -> [FAIL][65] +41 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][66] ([Intel XE#1124]) -> [FAIL][67] +56 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][68] ([Intel XE#2328]) -> [FAIL][69] +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     [SKIP][70] ([Intel XE#619]) -> [FAIL][71] +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          [SKIP][72] ([Intel XE#1467]) -> [FAIL][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][74] ([Intel XE#607]) -> [FAIL][75] +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#607]) -> [FAIL][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][78] ([Intel XE#610]) -> [FAIL][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          [SKIP][80] ([Intel XE#2191]) -> [FAIL][81] +6 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#2191]) -> [FAIL][83] +7 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          [SKIP][84] ([Intel XE#1512]) -> [FAIL][85] +7 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][86] ([Intel XE#2314] / [Intel XE#2894]) -> [FAIL][87] +7 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#367]) -> [FAIL][89] +20 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][90] ([Intel XE#367]) -> [FAIL][91] +7 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][92] ([Intel XE#367]) -> [FAIL][93] +8 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][94] ([Intel XE#2887]) -> [FAIL][95] +62 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#455] / [Intel XE#787]) -> [FAIL][97] +73 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#2907]) -> [FAIL][99] +9 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-lnl:          [SKIP][100] ([Intel XE#2669]) -> [FAIL][101] +4 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][102] ([Intel XE#2887]) -> [FAIL][103] +81 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][104] ([Intel XE#3862]) -> [FAIL][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#3442]) -> [FAIL][107] +1 other test fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-lnl:          [SKIP][108] ([Intel XE#3433]) -> [FAIL][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [SKIP][110] ([Intel XE#3432]) -> [FAIL][111] +9 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][112] ([Intel XE#3432]) -> [FAIL][113] +6 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][114] ([Intel XE#1727]) -> [FAIL][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][116] ([Intel XE#2652] / [Intel XE#787]) -> [FAIL][117] +3 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][118] ([Intel XE#314]) -> [FAIL][119] +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_cdclk@mode-transition.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][120] ([Intel XE#2724]) -> [FAIL][121] +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#314]) -> [FAIL][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][124] ([Intel XE#1152]) -> [FAIL][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_cdclk@plane-scaling.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][126] ([Intel XE#306]) -> [FAIL][127] +9 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][128] ([Intel XE#2325]) -> [FAIL][129] +6 other tests fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#306]) -> [FAIL][131] +9 other tests fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][132] ([Intel XE#2252]) -> [FAIL][133] +39 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#373]) -> [FAIL][135] +50 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-lnl:          [SKIP][136] ([Intel XE#373]) -> [FAIL][137] +53 other tests fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][138] ([Intel XE#2341]) -> [FAIL][139] +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_content_protection@content-type-change.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#307]) -> [FAIL][141] +3 other tests fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          [SKIP][142] ([Intel XE#307]) -> [FAIL][143] +4 other tests fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][144] ([Intel XE#2390]) -> [FAIL][145] +2 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][146] ([Intel XE#1178]) -> [FAIL][147] +3 other tests fail
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_content_protection@legacy.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][148] ([Intel XE#1178]) -> [FAIL][149] +4 other tests fail
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][150] ([Intel XE#1468]) -> [FAIL][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_content_protection@mei-interface.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][152] ([Intel XE#1188]) -> [FAIL][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_content_protection@uevent.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_content_protection@uevent.html
    - shard-lnl:          [SKIP][154] ([Intel XE#3278]) -> [FAIL][155] +7 other tests fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@kms_content_protection@uevent.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][156] ([Intel XE#2320]) -> [FAIL][157] +24 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#308]) -> [FAIL][159] +8 other tests fail
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          [SKIP][160] ([Intel XE#2321]) -> [FAIL][161] +9 other tests fail
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][162] ([Intel XE#1424]) -> [FAIL][163] +27 other tests fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][164] ([Intel XE#2321]) -> [FAIL][165] +5 other tests fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][166] ([Intel XE#309]) -> [FAIL][167] +28 other tests fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#323]) -> [FAIL][169] +5 other tests fail
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          [SKIP][170] ([Intel XE#323]) -> [FAIL][171] +5 other tests fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][172] ([Intel XE#2286]) -> [FAIL][173] +3 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][174] ([Intel XE#2291]) -> [FAIL][175] +1 other test fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][176] ([Intel XE#877]) -> [FAIL][177] +1 other test fail
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][178] ([Intel XE#1508]) -> [FAIL][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][180] ([Intel XE#2141]) -> [FAIL][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][182] ([Intel XE#1508]) -> [FAIL][183] +1 other test fail
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][184] ([Intel XE#3383]) -> [FAIL][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          [SKIP][186] ([Intel XE#3070]) -> [FAIL][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][188] ([Intel XE#2244]) -> [FAIL][189] +4 other tests fail
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][190] ([Intel XE#2244]) -> [FAIL][191] +7 other tests fail
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#701]) -> [FAIL][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          [SKIP][194] ([Intel XE#701]) -> [FAIL][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@kms_feature_discovery@chamelium.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][196] ([Intel XE#702]) -> [FAIL][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_feature_discovery@display-2x.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][198] ([Intel XE#703]) -> [FAIL][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_feature_discovery@display-3x.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          [SKIP][200] ([Intel XE#2373]) -> [FAIL][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#703]) -> [FAIL][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][204] ([Intel XE#1138]) -> [FAIL][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_feature_discovery@display-4x.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1138]) -> [FAIL][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          [SKIP][208] ([Intel XE#1138]) -> [FAIL][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1137]) -> [FAIL][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          [SKIP][212] ([Intel XE#1137]) -> [FAIL][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_feature_discovery@dp-mst.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1135]) -> [FAIL][215] +1 other test fail
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_feature_discovery@psr1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][216] ([Intel XE#2882]) -> [FAIL][217] +1 other test fail
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][218] ([Intel XE#301]) -> [FAIL][219] +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          [SKIP][220] ([Intel XE#1421]) -> [FAIL][221] +35 other tests fail
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][222] ([Intel XE#2316]) -> [FAIL][223] +2 other tests fail
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-lnl:          [INCOMPLETE][224] ([Intel XE#1504]) -> [FAIL][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][226] ([Intel XE#2597]) -> [FAIL][227] +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][228] ([Intel XE#2380]) -> [FAIL][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][230] ([Intel XE#1397] / [Intel XE#1745]) -> [FAIL][231] +7 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][232] ([Intel XE#2293] / [Intel XE#2380]) -> [FAIL][233] +19 other tests fail
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          [SKIP][234] ([Intel XE#1401] / [Intel XE#1745]) -> [FAIL][235] +25 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][236] ([Intel XE#2311]) -> [FAIL][237] +121 other tests fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][238] ([Intel XE#2312]) -> [FAIL][239] +25 other tests fail
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#651]) -> [FAIL][241] +160 other tests fail
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][242] ([Intel XE#2333]) -> [FAIL][243] +53 other tests fail
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][244] ([Intel XE#651]) -> [FAIL][245] +79 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#658]) -> [FAIL][247] +2 other tests fail
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          [SKIP][248] ([Intel XE#1469]) -> [FAIL][249] +2 other tests fail
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          [SKIP][250] ([Intel XE#2352]) -> [FAIL][251] +1 other test fail
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#653]) -> [FAIL][253] +159 other tests fail
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1158]) -> [FAIL][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          [SKIP][256] ([Intel XE#2350]) -> [FAIL][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][258] ([Intel XE#2313]) -> [FAIL][259] +115 other tests fail
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][260] ([Intel XE#656]) -> [FAIL][261] +217 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [INCOMPLETE][262] -> [FAIL][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][264] ([Intel XE#3374] / [Intel XE#3544]) -> [FAIL][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][266] ([Intel XE#1503]) -> [FAIL][267] +3 other tests fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][268] ([Intel XE#1450] / [Intel XE#2568]) -> [FAIL][269]
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#346]) -> [FAIL][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          [SKIP][272] ([Intel XE#346]) -> [FAIL][273] +1 other test fail
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][274] ([Intel XE#3012]) -> [FAIL][275]
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][276] ([Intel XE#2934]) -> [FAIL][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2925]) -> [FAIL][279] +1 other test fail
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][280] ([Intel XE#346]) -> [FAIL][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          [SKIP][282] ([Intel XE#2934]) -> [FAIL][283]
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2927]) -> [FAIL][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-lnl:          [SKIP][286] ([Intel XE#2927]) -> [FAIL][287] +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][288] ([Intel XE#2501]) -> [FAIL][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#356]) -> [FAIL][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          [SKIP][292] ([Intel XE#356]) -> [FAIL][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][294] ([Intel XE#616]) -> [FAIL][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_plane_cursor@primary.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][296] ([Intel XE#599]) -> [FAIL][297] +4 other tests fail
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][298] ([Intel XE#2393]) -> [FAIL][299] +1 other test fail
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][300] ([Intel XE#2493]) -> [FAIL][301] +1 other test fail
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-lnl:          [SKIP][302] ([Intel XE#2493]) -> [FAIL][303] +1 other test fail
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][304] ([Intel XE#361]) -> [FAIL][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-lnl:          [SKIP][306] ([Intel XE#3307]) -> [FAIL][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_plane_scaling@intel-max-src-size.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2763] / [Intel XE#455]) -> [FAIL][309] +7 other tests fail
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          [SKIP][310] ([Intel XE#2763]) -> [FAIL][311] +22 other tests fail
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][312] ([Intel XE#2763]) -> [FAIL][313] +10 other tests fail
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][314] ([Intel XE#2938]) -> [FAIL][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2938]) -> [FAIL][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][318] ([Intel XE#870]) -> [FAIL][319] +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_pm_backlight@fade.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_pm_backlight@fade.html
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#870]) -> [FAIL][321] +3 other tests fail
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_pm_backlight@fade.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][322] ([Intel XE#2391]) -> [FAIL][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#1122]) -> [FAIL][325]
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          [SKIP][326] ([Intel XE#736]) -> [FAIL][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][328] ([Intel XE#718]) -> [FAIL][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][330] ([Intel XE#2392]) -> [FAIL][331] +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1129]) -> [FAIL][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          [SKIP][334] ([Intel XE#3309]) -> [FAIL][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          [SKIP][336] ([Intel XE#3309]) -> [FAIL][337]
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#908]) -> [FAIL][339] +1 other test fail
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          [FAIL][340] ([Intel XE#1430]) -> [FAIL][341]
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][342] ([Intel XE#1430]) -> [FAIL][343] +1 other test fail
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][344] ([Intel XE#2505]) -> [FAIL][345]
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          [FAIL][346] ([Intel XE#2029]) -> [FAIL][347]
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][348] ([Intel XE#2499]) -> [FAIL][349]
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][350] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [FAIL][351] +1 other test fail
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][352] ([Intel XE#1439] / [Intel XE#836]) -> [FAIL][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          [SKIP][354] ([Intel XE#1439] / [Intel XE#836]) -> [FAIL][355]
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][356] ([Intel XE#1439] / [Intel XE#3141]) -> [FAIL][357] +2 other tests fail
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1489]) -> [FAIL][359] +45 other tests fail
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][360] ([Intel XE#2893]) -> [FAIL][361] +22 other tests fail
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][362] ([Intel XE#1489]) -> [FAIL][363] +37 other tests fail
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][364] ([Intel XE#2234] / [Intel XE#2850]) -> [FAIL][365] +58 other tests fail
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          [SKIP][366] ([Intel XE#1406]) -> [FAIL][367] +27 other tests fail
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_psr@pr-no-drrs.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2850] / [Intel XE#929]) -> [FAIL][369] +83 other tests fail
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_psr@psr-dpms.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][370] ([Intel XE#2234]) -> [FAIL][371]
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][372] ([Intel XE#3414]) -> [FAIL][373] +5 other tests fail
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][374] ([Intel XE#3414]) -> [FAIL][375] +10 other tests fail
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#3414]) -> [FAIL][377] +10 other tests fail
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][378] ([Intel XE#1127]) -> [FAIL][379] +3 other tests fail
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          [SKIP][380] ([Intel XE#2330]) -> [FAIL][381]
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#1127]) -> [FAIL][383] +1 other test fail
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][384] ([Intel XE#2413]) -> [FAIL][385] +2 other tests fail
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          [SKIP][386] ([Intel XE#2413] / [Intel XE#374]) -> [FAIL][387]
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][388] ([Intel XE#2426]) -> [FAIL][389] +1 other test fail
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          [SKIP][390] ([Intel XE#362]) -> [FAIL][391] +1 other test fail
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#1500]) -> [FAIL][393]
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][394] ([Intel XE#899]) -> [FAIL][395]
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][396] ([Intel XE#2168]) -> [FAIL][397]
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@kms_vrr@cmrr.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#455]) -> [FAIL][399] +70 other tests fail
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-435/igt@kms_vrr@flipline.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2168]) -> [FAIL][401] +1 other test fail
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@kms_vrr@lobf.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][402] ([Intel XE#1499]) -> [FAIL][403] +3 other tests fail
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_vrr@negative-basic.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][404] ([Intel XE#1499]) -> [FAIL][405] +4 other tests fail
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#756]) -> [FAIL][407] +5 other tests fail
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          [SKIP][408] ([Intel XE#756]) -> [FAIL][409] +4 other tests fail
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-7/igt@kms_writeback@writeback-fb-id.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][410] ([Intel XE#756]) -> [FAIL][411] +5 other tests fail
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12352_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][412] ([Intel XE#1695])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][413] ([Intel XE#776])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][414] ([Intel XE#2340])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][415] ([Intel XE#2387])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][416] -> [FAIL][417] ([Intel XE#2883]) +2 other tests fail
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][418] ([Intel XE#1435])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][419] ([Intel XE#2450])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][420] ([Intel XE#1091] / [Intel XE#2849])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][421] ([Intel XE#1126])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][422] ([Intel XE#2504])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][423] ([Intel XE#3889])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][424] ([Intel XE#2905]) +4 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][425] ([Intel XE#2905]) +13 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][426] ([Intel XE#688]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][427] ([Intel XE#1473])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][428] -> [TIMEOUT][429] ([Intel XE#1473])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][430] ([Intel XE#1473] / [Intel XE#2472])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][431] ([Intel XE#1392]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][432] ([Intel XE#2322]) +11 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][433] ([Intel XE#288]) +8 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][434] ([Intel XE#2905]) +3 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][435] ([Intel XE#2229])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          [PASS][436] -> [SKIP][437] ([Intel XE#1192])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][438] ([Intel XE#2229])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          NOTRUN -> [SKIP][439] ([Intel XE#1192])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [PASS][462]) -> ([PASS][463], [PASS][464], [PASS][465], [PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474], [PASS][475], [SKIP][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488]) ([Intel XE#2457])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-3/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][489] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][490] ([Intel XE#2838] / [Intel XE#979])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][491] ([Intel XE#2284])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][492] ([Intel XE#2284]) +3 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][493] ([Intel XE#584]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-bmg:          [PASS][494] -> [DMESG-WARN][495] ([Intel XE#3859])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][496] ([Intel XE#944]) +2 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_query@multigpu-query-config.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][497] ([Intel XE#944])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@xe_query@multigpu-query-config.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [SKIP][498] ([Intel XE#1192]) -> [PASS][499]
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][500] ([Intel XE#1794]) -> [PASS][501]
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][502] ([Intel XE#1473]) -> [INCOMPLETE][503] ([Intel XE#1473])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [FAIL][504] ([Intel XE#1000]) -> [TIMEOUT][505] ([Intel XE#1473])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][506] ([Intel XE#1473] / [Intel XE#2472]) -> [INCOMPLETE][507] ([Intel XE#1473])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][508] ([Intel XE#2833]) -> [SKIP][509] ([Intel XE#1192] / [Intel XE#3026])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
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
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#3859]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3859
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8165 -> IGTPW_12352
  * Linux: xe-2399-f0dab21571bf17512904e5c395817305acaa351a -> xe-2400-4d485df56628d613cca2abc4b8043e9b3bc2b5be

  IGTPW_12352: abfecf75e0b6c6d358c0ccb213533a8f2debe44d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8165: 4d630db8b8cfbccd2b871e5084e5c039c374fb14 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2399-f0dab21571bf17512904e5c395817305acaa351a: f0dab21571bf17512904e5c395817305acaa351a
  xe-2400-4d485df56628d613cca2abc4b8043e9b3bc2b5be: 4d485df56628d613cca2abc4b8043e9b3bc2b5be

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/index.html

--===============6835002032171680800==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v1,1/2] lib/igt_=
kms: Add support to retrieve async modifiers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142693/">https://patchwork.freedesktop.org/series/142693/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12352/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12352/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8165_full -&gt; XEIGTPW_12352_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12352_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12352_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
352_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonbl=
ocking-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_atomic_transition@modeset-t=
ransition-nonblocking-fencing.html">FAIL</a> +618 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.ht=
ml">FAIL</a> +348 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-=
2/igt@kms_flip@2x-nonexisting-fb.html">FAIL</a> +384 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp=
-4tile-to-64bpp-4tile-downscaling.html">FAIL</a> +115 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-indfb-msflip-blt.html">FAIL</a> +84 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-=
lnl-4/igt@kms_getfb@getfb2-handle-not-fb.html">FAIL</a> +630 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_ccs@suspend-resume.html">INCO=
MPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@xe_exec_basic@once-userptr-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/sha=
rd-bmg-2/igt@xe_exec_basic@once-userptr-rebind.html">INCOMPLETE</a> +1 othe=
r test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-=
2/igt@xe_gt_freq@freq_fixed_exec.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">INCO=
MPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2233">Intel XE#2233</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small=
-legacy.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/623">Intel XE#623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-sma=
ll-legacy.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1466">Intel XE#1466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small=
-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/911">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_async_flips@async-flip-with-pag=
e-flip-events.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_async_flips@crc.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Intel XE#378=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-bmg-2/igt@kms_async_flips@crc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_async_flips@crc-atomic.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Int=
el XE#3781</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12352/shard-dg2-434/igt@kms_async_flips@crc-atomic.html">FAIL</a> +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Inte=
l XE#873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html">FAIL</a>=
</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Inte=
l XE#873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html">FAIL</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3768">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_async_flips@invalid-async-flip-a=
tomic.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_async_flips@invalid-async-flip-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
68">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-lnl-3/igt@kms_async_flips@invalid-async-flip-atomi=
c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#66=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-lnl-8/igt@kms_async_flips@test-cursor.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3279">Intel XE#3279</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_atomic@plane-primary-overlay-mut=
able-zpos.html">FAIL</a> +2 other tests fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2385">Intel XE#2385</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mut=
able-zpos.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">F=
AIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12352/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">FAIL</=
a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-=
hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3658">Intel XE#3658</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_big_fb@4-tile=
d-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> +2 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
5">Intel XE#1725</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12352/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-180.html">=
FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12352/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">FAIL=
</a> +23 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12352/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">FAIL</a>=
 +59 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1477">Intel XE#1477</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset=
-overflow.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610=
">Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.ht=
ml">FAIL</a> +1 other test fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428"=
>Intel XE#1428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html=
">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12352/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">FAIL</=
a> +41 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html=
">FAIL</a> +56 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#232=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html">FAIL</a> +1 other test f=
ail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#61=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html">FAIL</a> +1 other test=
 fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#146=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset=
-overflow.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-of=
fset-overflow.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"=
>Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html=
">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_bw@connected-linear-t=
iling-4-displays-1920x1080p.html">FAIL</a> +7 other tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1512">Intel XE#1512</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_bw@connecte=
d-linear-tiling-4-displays-3840x2160p.html">FAIL</a> +7 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12352/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x=
1080p.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12352/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-3840x2160=
p.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12352/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440=
p.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-m=
c-ccs.html">FAIL</a> +62 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">FAIL</a> +73 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
07">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-cc=
s.html">FAIL</a> +9 other tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669=
">Intel XE#2669</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12352/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.ht=
ml">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-mc-ccs.html">FAIL</a> +81 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3442">Intel XE#3442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">FAIL</a> +1 other test fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3433">Intel XE#3433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652=
">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tile=
d-lnl-ccs.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352=
/shard-lnl-4/igt@kms_cdclk@mode-transition.html">FAIL</a> +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">=
Intel XE#2724</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">=
FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"=
>Intel XE#314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html=
">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1235=
2/shard-lnl-8/igt@kms_cdclk@plane-scaling.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Int=
el XE#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12352/shard-lnl-6/igt@kms_chamelium_color@ctm-blue-to-red.html">FAIL</=
a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">In=
tel XE#2325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12352/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html">FAIL=
</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#30=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-dg2-436/igt@kms_chamelium_color@gamma.html">FAIL</a> +9 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hiberna=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-chan=
ge-during-hibernate.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-ena=
bled-mode.html">FAIL</a> +50 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352=
/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd.html">FAIL</a> +53 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
341">Intel XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12352/shard-bmg-7/igt@kms_content_protection@content-type-cha=
nge.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
07">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12352/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-=
0.html">FAIL</a> +3 other tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307=
">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.ht=
ml">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">I=
ntel XE#2390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12352/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html">FA=
IL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-bmg-6/igt@kms_content_protection@legacy.html">FAIL</a> +3 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12352/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL=
</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">I=
ntel XE#1468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12352/shard-lnl-3/igt@kms_content_protection@mei-interface.html">FA=
IL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12352/shard-dg2-436/igt@kms_content_protection@uevent.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE=
#3278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-lnl-4/igt@kms_content_protection@uevent.html">FAIL</a> +7 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"=
>Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html=
">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308=
">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.ht=
ml">FAIL</a> +8 other tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html=
">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1424">Intel XE#1424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12352/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-1=
28x42.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">=
Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@kms_cursor_legacy@2x-nonbl=
ocking-modeset-vs-cursor-atomic.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-curso=
r-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12352/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_cursor_legacy@bas=
ic-busy-flip-before-cursor-varying-size.html">FAIL</a> +3 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">FAIL</a> +1 o=
ther test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel X=
E#1508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12352/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE=
#2141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE=
#1508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">FAIL</a> +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383">=
Intel XE#3383</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html">=
FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">=
Intel XE#3070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">In=
tel XE#2244</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12352/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">FAIL=
</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#=
2244</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12352/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html">FAIL</a> +7 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel=
 XE#701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12352/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">FAIL</a></=
li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel X=
E#701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-lnl-5/igt@kms_feature_discovery@chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel =
XE#702</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12352/shard-lnl-8/igt@kms_feature_discovery@display-2x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel =
XE#703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12352/shard-lnl-1/igt@kms_feature_discovery@display-3x.html">FAIL</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-bmg-4/igt@kms_feature_discovery@display-3x.html">FAIL</a></=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Inte=
l XE#703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">FAIL</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel=
 XE#1138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-bmg-8/igt@kms_feature_discovery@display-4x.html">FAIL</a></=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Int=
el XE#1138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12352/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">FAIL</=
a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel=
 XE#1138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-lnl-3/igt@kms_feature_discovery@display-4x.html">FAIL</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel X=
E#1137</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12352/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#=
1137</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12352/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#=
1135</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12352/shard-dg2-434/igt@kms_feature_discovery@psr1.html">FAIL</a> +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12352/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
21">Intel XE#1421</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptibl=
e.html">FAIL</a> +35 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504=
">Intel XE#1504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12352/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible.html">FA=
IL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel X=
E#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12352/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">FAIL</a> +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@kms_flip_s=
caled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">FAIL</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-l=
inear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-2/igt@k=
ms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">FAIL=
</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">FAIL=
</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_=
flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">FAIL</a> =
+25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_frontbuffer_track=
ing@drrs-1p-offscren-pri-indfb-draw-blt.html">FAIL</a> +121 other tests fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> +25 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"=
>Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html=
">FAIL</a> +160 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> +53 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">FAIL</a> +79 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
658">Intel XE#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tilin=
g-y.html">FAIL</a> +2 other tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
69">Intel XE#1469</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-=
y.html">FAIL</a> +2 other tests fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
52">Intel XE#2352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-=
y.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-sp=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-464/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> +159 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/115=
8">Intel XE#1158</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12352/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.=
html">FAIL</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350"=
>Intel XE#2350</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12352/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html=
">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">FAIL</a> +115 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_frontbuffer_track=
ing@psr-2p-scndscrn-pri-indfb-draw-render.html">FAIL</a> +217 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shar=
d-bmg-4/igt@kms_hdr@bpc-switch-suspend.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html">FAIL</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#15=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
352/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html">FAIL</a> +3 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel =
XE#1450</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.html=
">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#=
346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2352/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#34=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Inte=
l XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12352/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">FAIL</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">In=
tel XE#2934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12352/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html">FAIL=
</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">=
Intel XE#2925</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">=
FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">I=
ntel XE#346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12352/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html">FA=
IL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2934">Intel XE#2934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ult=
ra-joiner.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
27">Intel XE#2927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joine=
r.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927=
">Intel XE#2927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12352/shard-lnl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.ht=
ml">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2501">Intel XE#2501</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/356">Intel XE#356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/356">Intel XE#356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-lnl-6/igt@kms_multipipe_modeset@basic-max-pipe-=
crc-check.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_plane_cursor@primary.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1235=
2/shard-dg2-434/igt@kms_plane_cursor@primary.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352=
/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html">FAIL</a> +4 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#23=
93</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
352/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#=
2493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12352/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">FAIL</a> +1 other =
test fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#=
2493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12352/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html">FAIL</a> +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">=
Intel XE#361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12352/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">=
FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">I=
ntel XE#3307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12352/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html">FA=
IL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25=
-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@kms_p=
lane_scaling@planes-downscale-factor-0-25-unity-scaling.html">FAIL</a> +7 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_plane_scali=
ng@planes-upscale-factor-0-25-downscale-factor-0-25.html">FAIL</a> +22 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_plane_scalin=
g@planes-upscale-factor-0-25-downscale-factor-0-5.html">FAIL</a> +10 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">=
Intel XE#2938</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html">=
FAIL</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938=
">Intel XE#2938</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12352/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/sha=
rd-bmg-6/igt@kms_pm_backlight@fade.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/=
shard-dg2-435/igt@kms_pm_backlight@fade.html">FAIL</a> +3 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel X=
E#2391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12352/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel=
 XE#1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">FAIL</a></=
li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE=
#736</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12352/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-=
lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard=
-bmg-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/sha=
rd-dg2-463/igt@kms_pm_dc@dc5-psr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE=
#3309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html">FAIL</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE=
#3309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shar=
d-dg2-463/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> +1 other test fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shar=
d-bmg-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard=
-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/sha=
rd-bmg-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/sha=
rd-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/sh=
ard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Int=
el XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12352/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">FAIL</a>=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel =
XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12352/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">=
FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">In=
tel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12352/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lps=
p.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1=
439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
41">Intel XE#3141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">FAIL</=
a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@kms_psr2_sf@=
fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">FAIL</a> +45 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2893">Intel XE#2893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-=
continuous-sf.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-e=
xceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_psr2_sf@psr2-ov=
erlay-plane-move-continuous-exceed-fully-sf.html">FAIL</a> +37 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#223=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12352/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html">FAIL</a> +=
58 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shar=
d-lnl-8/igt@kms_psr@pr-no-drrs.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel =
XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12352/shard-dg2-463/igt@kms_psr@psr-dpms.html">FAIL</a> +83 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2=
234</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2352/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Inte=
l XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12352/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html">FAIL</a>=
 +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3414">Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-refl=
ect-x-0.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12352/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-re=
flect-x-0.html">FAIL</a> +3 other tests fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2330">Intel XE#2330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-re=
flect-x-0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-180.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">=
Intel XE#2413</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12352/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html">=
FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">In=
tel XE#2413</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/374">Intel XE#374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12352/shard-lnl-3/igt@kms_scaling_modes@scaling-mode-non=
e.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12352/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> +1 other test fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">In=
tel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12352/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL=
</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Inte=
l XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-=
6/igt@kms_vrr@cmrr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-=
dg2-435/igt@kms_vrr@flipline.html">FAIL</a> +70 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-dg=
2-466/igt@kms_vrr@lobf.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1235=
2/shard-lnl-8/igt@kms_vrr@negative-basic.html">FAIL</a> +3 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12352/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html">FAIL</a> +4 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel X=
E#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12352/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">FAIL</a> +5 ot=
her tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-7/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#=
756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2352/shard-lnl-5/igt@kms_writeback@writeback-fb-id.html">FAIL</a> +4 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">I=
ntel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12352/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html">FA=
IL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12352_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
95">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel=
 XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-=
lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-=
reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@xe_eudebug_online@interrupt-ot=
her-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-8/igt@xe_evict@evict-cm-threads-small-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_evict@evict-mixed-many-thread=
s-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2352/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"=
>Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_evict@evict-threads-large.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-435/igt@xe_exec_fault_mode@many-bindex=
ecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-w=
ritesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migra=
te_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-lnl-2/=
igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-3/igt@xe_live_ktest@xe_migrate@xe_vali=
date_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">=
Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8165/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8165/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8165/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8165/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8165/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8165/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
165/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8165/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8165/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12352/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2352/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12352/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12352/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-3/igt@xe_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12352/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12352/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
352/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12352/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12352/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel =
XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@xe_oa@privileged-forked-access=
-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-lnl-7/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#=
584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12352/shard-bmg-2=
/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3859">Intel XE#3859</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-bmg-8/igt@xe_query@multigpu-query-config.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-463/igt@xe_query@multigpu-query-config=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1235=
2/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#179=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_123=
52/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12352/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many=
-threads-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Inte=
l XE#1000</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12352/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">I=
ntel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">=
Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2472">Intel XE#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12352/shard-bmg-6/igt@xe_evict@evict-mixed-threads-l=
arge.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8165/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1235=
2/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026">Intel XE=
#3026</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8165 -&gt; IGTPW_12352</li>
<li>Linux: xe-2399-f0dab21571bf17512904e5c395817305acaa351a -&gt; xe-2400-4=
d485df56628d613cca2abc4b8043e9b3bc2b5be</li>
</ul>
<p>IGTPW_12352: abfecf75e0b6c6d358c0ccb213533a8f2debe44d @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8165: 4d630db8b8cfbccd2b871e5084e5c039c374fb14 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2399-f0dab21571bf17512904e5c395817305acaa351a: f0dab21571bf17512904e5c=
395817305acaa351a<br />
  xe-2400-4d485df56628d613cca2abc4b8043e9b3bc2b5be: 4d485df56628d613cca2abc=
4b8043e9b3bc2b5be</p>

</body>
</html>

--===============6835002032171680800==--
