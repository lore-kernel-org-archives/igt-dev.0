Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCA2C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 06:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A685C10E502;
	Tue,  4 Mar 2025 06:07:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B308910E4FF;
 Tue,  4 Mar 2025 06:07:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6459933091140148033=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Some_refactor=2C_rewrite_a?=
 =?utf-8?q?nd_fixes_for_OA_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 04 Mar 2025 06:07:35 -0000
Message-ID: <174106845570.462265.16866578664576299557@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

--===============6459933091140148033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Some refactor, rewrite and fixes for OA tests (rev2)
URL   : https://patchwork.freedesktop.org/series/144916/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8257_full -> XEIGTPW_12694_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12694_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12694_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12694_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_interruptible@legacy-setmode:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +14 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_atomic_interruptible@legacy-setmode.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_atomic_interruptible@legacy-setmode.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][3] +41 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_display_modes@extended-mode-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_display_modes@extended-mode-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][8] ([Intel XE#3719] / [Intel XE#911]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          [SKIP][10] ([Intel XE#3279]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [SKIP][12] ([Intel XE#4471]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][14] ([Intel XE#1407]) -> [SKIP][15] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][16] ([Intel XE#1477]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          [SKIP][18] ([Intel XE#1124]) -> [SKIP][19] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          [SKIP][20] ([Intel XE#1512]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][22] ([Intel XE#2887]) -> [SKIP][23] +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          [SKIP][24] ([Intel XE#3432]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][26] ([Intel XE#4472]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          [SKIP][28] ([Intel XE#307]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][30] ([Intel XE#309]) -> [SKIP][31] +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][32] ([Intel XE#323]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          [SKIP][34] ([Intel XE#2244]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][36] ([Intel XE#362]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@valid-flag}:
    - shard-lnl:          NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_create@valid-flag.html

  
New tests
---------

  New tests have been introduced between XEIGT_8257_full and XEIGTPW_12694_full:

### New IGT tests (3) ###

  * igt@xe_oa@buffer-size:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.89] s

  * igt@xe_oa@buffer-size@ccs-0-128m:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@xe_oa@buffer-size@rcs-0-32m:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12694_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-write:
    - shard-lnl:          [PASS][39] -> [SKIP][40] ([Intel XE#2134])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@fbdev@unaligned-write.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2233])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#3768])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3768])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][44] ([Intel XE#324])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3279])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2370]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2327]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#316]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1407]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1124]) +14 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#619])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1124]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1124]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#4472]) +10 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2191])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#367]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#367])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#367]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1512])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#787]) +259 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455] / [Intel XE#787]) +70 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2669]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2887]) +22 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#3442])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#4199])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][68] -> [INCOMPLETE][69] ([Intel XE#3862]) +2 other tests incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#3432]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#3432])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2907]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][75] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][76] -> [INCOMPLETE][77] ([Intel XE#2705] / [Intel XE#3113])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2887]) +13 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2724])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#4418])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4417]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#373]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#306])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2325])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#306])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#373]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2252]) +13 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2390])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#307])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#1178]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#3278]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2320]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#308]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1424]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2321]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#309]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2291]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2286])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
    - shard-lnl:          [PASS][101] -> [SKIP][102] ([Intel XE#4471]) +19 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#309]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][104] ([Intel XE#877])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1508])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1508])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#4354])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2244]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4422]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-1x:
    - shard-lnl:          [PASS][110] -> [SKIP][111] ([Intel XE#702])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_feature_discovery@display-1x.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#702])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#703])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1138])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1138])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1138])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [PASS][117] -> [SKIP][118] ([Intel XE#1135])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_feature_discovery@psr1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][119] ([Intel XE#301]) +2 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][120] -> [FAIL][121] ([Intel XE#3321])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#310])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][124] -> [SKIP][125] ([Intel XE#2316]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1421]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][127] -> [DMESG-WARN][128] ([Intel XE#2955])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2316]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#310]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [PASS][131] -> [SKIP][132] ([Intel XE#2482]) +11 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2482]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][134] -> [FAIL][135] ([Intel XE#886]) +1 other test fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][136] ([Intel XE#886]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1401]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1745]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1397]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          [PASS][142] -> [SKIP][143] ([Intel XE#1745]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2293]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#651]) +8 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2311]) +31 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#4141]) +19 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#656]) +11 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][150] -> [SKIP][151] ([Intel XE#656]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2312]) +13 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2548]) +41 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#651]) +32 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#658])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2352])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#653]) +36 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [PASS][158] -> [SKIP][159] ([Intel XE#2548]) +24 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#656]) +25 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2313]) +33 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#605])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2568])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2934]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#346])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#346])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#4328])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#2925])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2486])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#4359])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][171] -> [SKIP][172] ([Intel XE#3380]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][173] -> [FAIL][174] ([Intel XE#616]) +1 other test fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_plane_cursor@viewport.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2393])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#309])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][177] ([Intel XE#2566]) +2 other tests dmesg-warn
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#3307])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#2763]) +19 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
    - shard-lnl:          [PASS][181] -> [SKIP][182] ([Intel XE#2763]) +23 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2763]) +29 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2763]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-lnl:          [PASS][185] -> [SKIP][186] ([Intel XE#870])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_pm_backlight@bad-brightness.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2938])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#2938])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#870]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#870])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][191] ([Intel XE#718])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2392])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#2505])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][195] ([Intel XE#4330]) +8 other tests dmesg-warn
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][197] -> [DMESG-WARN][198] ([Intel XE#2042] / [Intel XE#4330])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#1489]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#1489]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          [PASS][201] -> [SKIP][202] ([Intel XE#1489]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#2893]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#1489]) +11 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#1406]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-primary-render:
    - shard-lnl:          [PASS][209] -> [SKIP][210] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_psr@psr-primary-render.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2414])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#2939])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#2939])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#4471]) +10 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2330])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#1127])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#3414]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#3414] / [Intel XE#3904])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-lnl:          [PASS][219] -> [SKIP][220] ([Intel XE#4472]) +18 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-180.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#2413])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#1435])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#1435])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][224] ([Intel XE#1729])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#2450])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@accuracy-idle:
    - shard-dg2-set2:     [PASS][226] -> [DMESG-WARN][227] ([Intel XE#4330]) +12 other tests dmesg-warn
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_vblank@accuracy-idle.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [PASS][228] -> [DMESG-WARN][229] ([Intel XE#4330]) +18 other tests dmesg-warn
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@kms_vblank@query-busy.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][230] ([Intel XE#4330]) +11 other tests dmesg-warn
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#455]) +25 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#1499])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#756])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#756])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#1091] / [Intel XE#2849])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#1091] / [Intel XE#2849])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][237] ([Intel XE#2705])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#1123])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#1126]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#1062])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2905]) +14 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#3889])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#3889])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#3889])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][246] ([Intel XE#2905]) +13 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#2905]) +11 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][248] ([Intel XE#688]) +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#1392]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][250] ([Intel XE#1392]) +7 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][251] -> [SKIP][252] ([Intel XE#1392]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#2322]) +14 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][254] ([Intel XE#288]) +20 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#2360])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][256] ([Intel XE#255])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][257] -> [FAIL][258] ([Intel XE#1999]) +2 other tests fail
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][259] ([Intel XE#586])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#512])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][261] ([Intel XE#512])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#1416])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][263] ([Intel XE#2457])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#378])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][265] ([Intel XE#378])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][266] ([Intel XE#2541] / [Intel XE#3573]) +8 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#1337])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#2284]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#2284] / [Intel XE#366])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][270] ([Intel XE#584]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][271] -> [DMESG-WARN][272] ([Intel XE#4330] / [Intel XE#569]) +1 other test dmesg-warn
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-bmg:          NOTRUN -> [ABORT][273] ([Intel XE#4268])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][274] ([Intel XE#944])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][275] ([Intel XE#944])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][276] ([Intel XE#944]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#4130])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][278] ([Intel XE#4130])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#4273])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][280] ([Intel XE#4351])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-bmg:          NOTRUN -> [SKIP][281] ([Intel XE#4351])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - shard-lnl:          [SKIP][282] ([Intel XE#2134]) -> [PASS][283] +1 other test pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@fbdev@info.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@fbdev@info.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][284] ([Intel XE#4471]) -> [PASS][285] +23 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-lnl:          [DMESG-WARN][286] ([Intel XE#2932]) -> [PASS][287] +2 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#309]) -> [PASS][289] +3 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][290] ([Intel XE#2291]) -> [PASS][291] +2 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-dg2-set2:     [INCOMPLETE][292] ([Intel XE#3226]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][294] ([Intel XE#4472]) -> [PASS][295] +13 other tests pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][296] ([Intel XE#4330]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#310]) -> [PASS][299] +7 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][300] ([Intel XE#2316]) -> [PASS][301] +3 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][302] ([Intel XE#886]) -> [PASS][303] +2 other tests pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [DMESG-WARN][304] ([Intel XE#2955]) -> [PASS][305] +4 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
    - shard-bmg:          [DMESG-WARN][306] ([Intel XE#2955]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][308] ([Intel XE#2049]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-lnl:          [SKIP][310] ([Intel XE#2482]) -> [PASS][311] +4 other tests pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_flip@flip-vs-panning-vs-hang.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-lnl:          [SKIP][312] ([Intel XE#1745]) -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][314] ([Intel XE#2548]) -> [PASS][315] +24 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#656]) -> [PASS][317] +1 other test pass
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-lnl:          [SKIP][318] ([Intel XE#4328]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_joiner@basic-force-big-joiner.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][320] ([Intel XE#4361]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_plane_multiple@tiling-4.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-lnl:          [SKIP][322] ([Intel XE#3308]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_plane_scaling@invalid-parameters.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-lnl:          [SKIP][324] ([Intel XE#2763]) -> [PASS][325] +13 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [DMESG-WARN][326] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][327] +1 other test pass
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-bmg:          [INCOMPLETE][328] ([Intel XE#2566]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#836]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [SKIP][332] -> [PASS][333] +6 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][334] ([Intel XE#1489]) -> [PASS][335] +6 other tests pass
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [SKIP][336] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][337] +8 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr@psr-no-drrs.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_psr@psr-no-drrs.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [DMESG-WARN][338] ([Intel XE#4330]) -> [PASS][339] +19 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_sequence@get-busy.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_sequence@get-busy.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [DMESG-WARN][340] ([Intel XE#4330]) -> [PASS][341] +59 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1392]) -> [PASS][343] +1 other test pass
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_compute_mode@many-execqueues-rebind:
    - shard-dg2-set2:     [INCOMPLETE][344] -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-rebind.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_exec_compute_mode@many-execqueues-rebind.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-bmg:          [FAIL][346] -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][348] -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][350], [PASS][351], [PASS][352], [SKIP][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375]) ([Intel XE#378]) -> ([PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [SKIP][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421]) ([Intel XE#2457]) -> ([PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438], [PASS][439])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][440] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][441] +2 other tests pass
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     [DMESG-WARN][442] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][443] +2 other tests pass
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_atomic@plane-cursor-legacy:
    - shard-lnl:          [SKIP][444] ([Intel XE#4472]) -> [DMESG-WARN][445] ([Intel XE#324])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_atomic@plane-cursor-legacy.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_atomic@plane-cursor-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][446] ([Intel XE#3279]) -> [SKIP][447] ([Intel XE#4471])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-lnl:          [DMESG-WARN][448] ([Intel XE#324]) -> [SKIP][449] ([Intel XE#4471])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          [SKIP][450] ([Intel XE#1407]) -> [SKIP][451] ([Intel XE#4472]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][452] ([Intel XE#4472]) -> [SKIP][453] ([Intel XE#1407]) +2 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][454] ([Intel XE#4472]) -> [SKIP][455] ([Intel XE#3658])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][456] ([Intel XE#1407]) -> [SKIP][457] ([Intel XE#4471]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          [SKIP][458] ([Intel XE#4471]) -> [SKIP][459] ([Intel XE#1407])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][460] ([Intel XE#4472]) -> [SKIP][461] ([Intel XE#4471]) +17 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][462] ([Intel XE#1124]) -> [SKIP][463] ([Intel XE#4472]) +3 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][464] ([Intel XE#4471]) -> [SKIP][465] ([Intel XE#1124]) +3 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][466] ([Intel XE#1124]) -> [SKIP][467] ([Intel XE#4471]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][468] ([Intel XE#4471]) -> [SKIP][469] ([Intel XE#1428])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][470] ([Intel XE#4472]) -> [SKIP][471] ([Intel XE#1124]) +2 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          [SKIP][472] ([Intel XE#2191]) -> [SKIP][473] ([Intel XE#4472]) +1 other test skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][474] ([Intel XE#4471]) -> [SKIP][475] ([Intel XE#2191])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          [SKIP][476] ([Intel XE#1512]) -> [SKIP][477] ([Intel XE#4472])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][478] ([Intel XE#367]) -> [SKIP][479] ([Intel XE#4472]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][480] ([Intel XE#4472]) -> [SKIP][481] ([Intel XE#367]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          [SKIP][482] ([Intel XE#1512]) -> [SKIP][483] ([Intel XE#4471])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][484] ([Intel XE#4472]) -> [SKIP][485] ([Intel XE#1512])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][487] ([Intel XE#787]) +9 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          [SKIP][488] ([Intel XE#4472]) -> [SKIP][489] ([Intel XE#2887]) +5 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][490] ([Intel XE#2887]) -> [SKIP][491] ([Intel XE#4472]) +6 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#787]) -> [SKIP][493] ([Intel XE#455] / [Intel XE#787])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][494] ([Intel XE#2887]) -> [SKIP][495] ([Intel XE#4471]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][496] ([Intel XE#3432]) -> [SKIP][497] ([Intel XE#4471]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][498] ([Intel XE#4199]) -> [INCOMPLETE][499] ([Intel XE#3862])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][500] ([Intel XE#3432]) -> [SKIP][501] ([Intel XE#4472])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][502] ([Intel XE#2669]) -> [SKIP][503] ([Intel XE#4472])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][504] -> [DMESG-WARN][505] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-lnl:          [SKIP][506] ([Intel XE#4471]) -> [SKIP][507] ([Intel XE#2887]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          [SKIP][508] ([Intel XE#3278]) -> [SKIP][509] ([Intel XE#4471])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_content_protection@atomic.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          [SKIP][510] ([Intel XE#4472]) -> [SKIP][511] ([Intel XE#3278])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_content_protection@content-type-change.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][512] ([Intel XE#4471]) -> [SKIP][513] ([Intel XE#307])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#455]) -> [FAIL][515] ([Intel XE#1178]) +1 other test fail
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_content_protection@legacy.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [DMESG-FAIL][516] ([Intel XE#4330]) -> [FAIL][517] ([Intel XE#1178])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][518] ([Intel XE#4472]) -> [SKIP][519] ([Intel XE#1468])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_content_protection@mei-interface.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-lnl:          [SKIP][520] ([Intel XE#1424]) -> [SKIP][521] ([Intel XE#4472]) +2 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          [SKIP][522] ([Intel XE#4471]) -> [SKIP][523] ([Intel XE#1424]) +1 other test skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][524] ([Intel XE#2321]) -> [SKIP][525] ([Intel XE#4472]) +1 other test skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          [SKIP][526] ([Intel XE#4471]) -> [SKIP][527] ([Intel XE#2321]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          [SKIP][528] ([Intel XE#4472]) -> [SKIP][529] ([Intel XE#1424]) +2 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          [SKIP][530] ([Intel XE#2321]) -> [SKIP][531] ([Intel XE#4471])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][532] ([Intel XE#1424]) -> [SKIP][533] ([Intel XE#4471]) +4 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][534] ([Intel XE#4472]) -> [SKIP][535] ([Intel XE#309]) +2 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][536] ([Intel XE#4471]) -> [SKIP][537] ([Intel XE#309])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          [SKIP][538] ([Intel XE#323]) -> [SKIP][539] ([Intel XE#4472])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][540] ([Intel XE#4330]) -> [SKIP][541] ([Intel XE#309]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [DMESG-WARN][542] ([Intel XE#4330]) -> [SKIP][543] ([Intel XE#2291])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          [SKIP][544] ([Intel XE#309]) -> [SKIP][545] ([Intel XE#4471]) +1 other test skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][546] ([Intel XE#4472]) -> [SKIP][547] ([Intel XE#323])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][548] ([Intel XE#4472]) -> [SKIP][549] ([Intel XE#4302])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_display_modes@extended-mode-basic.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          [SKIP][550] ([Intel XE#4354]) -> [SKIP][551] ([Intel XE#4472])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#4331]) -> [DMESG-WARN][553] ([Intel XE#4330])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][554] ([Intel XE#4331]) -> [SKIP][555] ([Intel XE#4471])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][556] ([Intel XE#4472]) -> [SKIP][557] ([Intel XE#2244])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [INCOMPLETE][558] ([Intel XE#2594]) -> [SKIP][559] ([Intel XE#455])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][560] ([Intel XE#4471]) -> [SKIP][561] ([Intel XE#4422])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][562] ([Intel XE#301]) -> [SKIP][563] ([Intel XE#310])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][564] ([Intel XE#301] / [Intel XE#3149]) -> [SKIP][565] ([Intel XE#2482])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][566] ([Intel XE#2049] / [Intel XE#2597]) -> [DMESG-WARN][567] ([Intel XE#2955])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-lnl:          [SKIP][568] ([Intel XE#2482]) -> [FAIL][569] ([Intel XE#886])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          [SKIP][570] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][571] ([Intel XE#1745]) +1 other test skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          [SKIP][572] ([Intel XE#1745]) -> [SKIP][573] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][574] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][575] ([Intel XE#1745]) +2 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][576] ([Intel XE#1745]) -> [SKIP][577] ([Intel XE#1397] / [Intel XE#1745])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][578] ([Intel XE#651]) -> [SKIP][579] ([Intel XE#2548]) +16 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][580] ([Intel XE#2312]) -> [SKIP][581] ([Intel XE#2311]) +5 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][582] ([Intel XE#2311]) -> [SKIP][583] ([Intel XE#2312]) +3 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][584] ([Intel XE#2312]) -> [SKIP][585] ([Intel XE#4141])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][586] ([Intel XE#4141]) -> [SKIP][587] ([Intel XE#2312]) +3 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][588] ([Intel XE#2548]) -> [SKIP][589] ([Intel XE#651]) +11 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#651]) -> [SKIP][591] ([Intel XE#656]) +8 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][592] ([Intel XE#2548]) -> [SKIP][593] ([Intel XE#656]) +30 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#656]) -> [SKIP][595] ([Intel XE#651]) +10 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#656]) -> [SKIP][597] ([Intel XE#653]) +8 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#653]) -> [SKIP][599] ([Intel XE#656]) +3 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][600] ([Intel XE#2313]) -> [SKIP][601] ([Intel XE#2312]) +9 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          [SKIP][602] ([Intel XE#1469]) -> [SKIP][603] ([Intel XE#2548])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][604] ([Intel XE#2312]) -> [SKIP][605] ([Intel XE#2313]) +4 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][606] ([Intel XE#656]) -> [SKIP][607] ([Intel XE#2548]) +44 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][608] ([Intel XE#3544]) -> [SKIP][609] ([Intel XE#3374] / [Intel XE#3544])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-lnl:          [SKIP][610] ([Intel XE#4471]) -> [SKIP][611] ([Intel XE#4472]) +9 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_hdr@invalid-hdr.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][612] ([Intel XE#4472]) -> [SKIP][613] ([Intel XE#1503]) +1 other test skip
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          [DMESG-WARN][614] ([Intel XE#324]) -> [SKIP][615] ([Intel XE#3380])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][616] ([Intel XE#599]) -> [SKIP][617] ([Intel XE#4472]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          [SKIP][618] ([Intel XE#4471]) -> [SKIP][619] ([Intel XE#2493])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][620] ([Intel XE#1430]) -> [SKIP][621] ([Intel XE#1129])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [SKIP][622] ([Intel XE#2861]) -> [FAIL][623] ([Intel XE#2029])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][624] ([Intel XE#1489]) -> [SKIP][625] ([Intel XE#2893]) +2 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][626] ([Intel XE#2893]) -> [SKIP][627] ([Intel XE#1489]) +5 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][628] ([Intel XE#1122]) -> [SKIP][629] ([Intel XE#1128])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          [SKIP][630] ([Intel XE#1128]) -> [SKIP][631] ([Intel XE#1122])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          [SKIP][632] ([Intel XE#1406]) -> [SKIP][633] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          [SKIP][634] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][635] ([Intel XE#1406]) +1 other test skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_psr@pr-sprite-blt.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          [SKIP][636] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][637] ([Intel XE#4471]) +1 other test skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][638] ([Intel XE#1127]) -> [SKIP][639] ([Intel XE#4471])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][640] ([Intel XE#1127]) -> [SKIP][641] ([Intel XE#4472])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          [SKIP][642] ([Intel XE#4472]) -> [SKIP][643] ([Intel XE#3414] / [Intel XE#3904])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][644] ([Intel XE#4472]) -> [SKIP][645] ([Intel XE#1127])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          [SKIP][646] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][647] ([Intel XE#4472])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][648] ([Intel XE#899]) -> [SKIP][649] ([Intel XE#4471])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][650] ([Intel XE#4472]) -> [SKIP][651] ([Intel XE#1499]) +1 other test skip
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [DMESG-WARN][652] ([Intel XE#4330]) -> [SKIP][653] ([Intel XE#1392])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2861
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3308
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4361
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471
  [Intel XE#4472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8257 -> IGTPW_12694
  * Linux: xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d -> xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc

  IGTPW_12694: 12694
  IGT_8257: 8257
  xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d: 413ae464b8021542ad90cb1fbb15f8efc5050a5d
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf891368b75a67e8700dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/index.html

--===============6459933091140148033==
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
<tr><td><b>Series:</b></td><td>Some refactor, rewrite and fixes for OA test=
s (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144916/">https://patchwork.freedesktop.org/series/144916/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12694/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12694/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8257_full -&gt; XEIGTPW_12694_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12694_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12694_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
694_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_atomic_interruptible@legacy-setmode.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_126=
94/shard-lnl-1/igt@kms_atomic_interruptible@legacy-setmode.html">SKIP</a> +=
14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride=
-64bpp-rotate-0-async-flip.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_display_modes@extended-mode-=
basic.html">DMESG-WARN</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_display_modes@extended-mode-basic.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_126=
94/shard-dg2-434/igt@kms_display_modes@extended-mode-basic.html">DMESG-WARN=
</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html"=
>SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_async_flip=
s@async-flip-with-page-flip-events-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3279">Intel XE#3279</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_atomic_transition@p=
lane-all-modeset-transition-fencing.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">S=
KIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Int=
el XE#1407</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12694/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</=
a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1477">Intel XE#1477</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset=
-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12694/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a>=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1512">Intel XE#1512</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12=
-rc-ccs.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/343=
2">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.=
html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-m=
tl-rc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">In=
tel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12694/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_legacy=
@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/sh=
ard-lnl-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/362">Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_create@valid-flag}:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_create@valid-flag.html">FAIL<=
/a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8257_full and XEIGTPW_12694=
_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@ccs-0-128m:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-32m:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12694_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt=
@fbdev@unaligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_async_flips@invalid-async-=
flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_atomic@plane-cursor-legacy@p=
ipe-a-edp-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 othe=
r tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_bw@connected-linear-tiling=
-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_bw@linear-tiling-1-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-til=
ed-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) +259 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +70 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12694/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4199">Intel XE#4199</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs=
@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +2 oth=
er tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_cdclk@mode-transition-all-=
outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to=
-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_chamelium_color@ctm-limite=
d-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_content_protection@dp-mst-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_content_protection@legacy@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12694/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
9">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2694/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">In=
tel XE#4471</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_feature_discovery@display-1x.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shar=
d-lnl-7/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_feature_discovery@psr1.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-=
1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@ac-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-d=
g2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2694/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12694/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310=
">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/=
shard-lnl-1/igt@kms_flip@blocking-absolute-wf_vblank.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#248=
2</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2482">Intel XE#2482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12694/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">I=
ntel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-inte=
rruptible@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xt=
ile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +19 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +41 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +32 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +36 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-fullscreen.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +24 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +25 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2313">Intel XE#2313</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_invalid_mode@int-max-clock.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_joiner@invalid-modeset-big=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
6">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb888=
8-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12694/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
80">Intel XE#3380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2=
-436/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-mu=
lti-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_plane_scaling@intel-max-sr=
c-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2566">Intel XE#2566</a>) +2 other tests dmesg-warn</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-wi=
th-pixel-format@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_plane_scaling@plane-d=
ownscale-factor-0-75-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +29 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_plane_scaling@planes-upsca=
le-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_pm_backlight@bad-brightness.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard=
-lnl-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_pm_backlight@fade-with-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4330">Intel XE#4330</a>) +8 other tests dmesg-warn</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/s=
hard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE=
#2042</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg=
-area.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12694/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-upda=
te-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_psr@psr-primary-render.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-=
7/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_rotation_crc@multiplane-rota=
tion-cropping-top.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-180.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/=
shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#447=
2</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@kms_tiled_display@basic-test-p=
attern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-=
463/igt@kms_vblank@accuracy-idle.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +12 oth=
er tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-7/igt@kms_vblank@query-busy.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt=
@kms_vblank@query-busy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +18 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_vblank@ts-continuation-suspe=
nd.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4330">Intel XE#4330</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@testdisplay.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">In=
tel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-=
0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_create@create-big-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
62">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadat=
a-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-=
reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufenc=
e-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-=
sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_eudebug_online@interrupt-al=
l-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_eudebug_online@interrupt-all-=
set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_evict@evict-beng-large-cm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind=
-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-=
batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_ku=
nit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Int=
el XE#512</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel=
 XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
57">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
8">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-433/igt@xe_pat@display-vs-wb-transient=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/=
igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-436/igt@xe_query@multigpu-query-cs-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_sriov_auto_provisioning@sel=
fconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-463/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@fbdev@info.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/=
igt@fbdev@info.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471"=
>Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-lnl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html=
">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">In=
tel XE#2932</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-l=
egacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-ato=
mic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-f=
lipa-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varyin=
g-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomi=
c-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_cur=
sor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">P=
ASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Inte=
l XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12694/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel=
 XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12694/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> +=
7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1269=
4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +3 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_126=
94/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2955">Intel XE#2955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modese=
t.html">PASS</a> +4 other tests pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
955">Intel XE#2955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-bmg-2/igt@kms_flip@flip-vs-dpms-off-vs-modeset.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@kms_flip@flip-vs-expired-v=
blank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel=
 XE#2482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12694/shard-lnl-6/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> +=
4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4t=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_flip_scaled_crc@=
flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +24 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Inte=
l XE#4328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12694/shard-lnl-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_plane_multiple@tiling-4.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4361">In=
tel XE#4361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-dg2-432/igt@kms_plane_multiple@tiling-4.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_plane_scaling@invalid-parameters.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3308">I=
ntel XE#3308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12694/shard-lnl-4/igt@kms_plane_scaling@invalid-parameters.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_plane_scaling@=
plane-scaler-with-clipping-clamping-modifiers.html">PASS</a> +13 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-c=
lamping-pixel-formats.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg=
2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-forma=
ts.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modif=
iers.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_plane_scaling@plane=
-upscale-20x20-with-modifiers.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1269=
4/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/=
igt@kms_pm_rpm@legacy-planes.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_psr2_sf@fbc-=
psr2-cursor-plane-move-continuous-exceed-fully-sf.html">PASS</a> +6 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel=
 XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12694/shard-lnl-8/igt@kms_psr@psr-no-drrs.html">PASS</a> +8 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_sequence@get-busy.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4=
330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2694/shard-bmg-2/igt@kms_sequence@get-busy.html">PASS</a> +19 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">=
Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12694/shard-dg2-464/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</=
a> +59 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"=
>Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-rebind.ht=
ml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12694/shard-dg2-464/igt@xe_exec_compute_mode@many-execqueues-rebin=
d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html"=
>FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12694/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function=
-xe_device_create.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_fault_injection@inj=
ect-fault-probe-function-xe_device_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8257/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8257/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8257/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8257/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-ln=
l-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
257/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8257/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8257/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8257/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12694/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard=
-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
694/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12694/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12694/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12694/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-ln=
l-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@xe_module_load@load.html"=
>PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8257/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8257/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8257/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
257/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12694/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12694/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12694/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12694/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel =
XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12694/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</=
a> +2 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Inte=
l XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12694/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_atomic@plane-cursor-legacy.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel X=
E#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12694/shard-lnl-8/igt@kms_atomic@plane-cursor-legacy.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel=
 XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transiti=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3279">Intel XE#3279</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_atomic_transition@plane-all=
-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-trans=
ition.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_atomic_transition@pl=
ane-toggle-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">In=
tel XE#1407</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">=
Intel XE#4472</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Int=
el XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12694/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">In=
tel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_big_fb@4-tile=
d-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Int=
el XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12694/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">In=
tel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Inte=
l XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12694/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Inte=
l XE#4471</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Int=
el XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12694/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">=
Intel XE#4471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471=
">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12694/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-1=
80-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_big_fb@yf-=
tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1512">Intel XE#1512</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12694/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4472">Intel XE#4472</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
512">Intel XE#1512</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x10=
80p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2560x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_ccs@ba=
d-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">=
Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12694/shard-lnl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4472">Intel XE#4472</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_ccs@bad-rota=
tion-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4471">Intel XE#4471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs=
-cc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4199">Intel XE#4199</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_ccs@crc-primary-su=
spend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669=
">Intel XE#2669</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12694/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12694/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-c=
cs-cc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE=
#3278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12694/shard-lnl-1/igt@kms_content_protection@atomic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#447=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-lnl-4/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">I=
ntel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12694/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"=
>Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12694/shard-dg2-432/igt@kms_content_protection@legacy.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1=
178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
30">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12694/shard-dg2-432/igt@kms_content_protection@lic-type-0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">I=
ntel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12694/shard-lnl-6/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468=
">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424"=
>Intel XE#1424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4472">Intel XE#4472</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">=
Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12694/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
24">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4472">Intel XE#4472</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471"=
>Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">In=
tel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12694/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">=
Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">I=
ntel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12694/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471=
">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1424">Intel XE#1424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-1=
28x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4471">Intel XE#4471</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-4/igt@kms_cursor_legacy@2=
x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_c=
ursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Inte=
l XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs=
-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
9">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12694/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4471">Intel XE#4471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_cursor_lega=
cy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">=
Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12694/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
02">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12694/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#447=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331=
">Intel XE#4331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12694/shard-dg2-434/igt@kms_dp_linktrain_fallback@dp-fallback.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331"=
>Intel XE#4331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-lnl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#=
4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12694/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel=
 XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12694/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visib=
le-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dir=
ty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">In=
tel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12694/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">I=
ntel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
82">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_flip@flip-vs-su=
spend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
82">Intel XE#2482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12694/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yt=
ileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"=
>Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp=
-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_flip_scaled=
_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"=
>Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-l=
inear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@k=
ms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">=
Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-3/igt@kms_flip_scaled_cr=
c@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel=
 XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_trac=
king@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +1=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_track=
ing@drrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr=
-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_frontbuffer_track=
ing@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri=
-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-5/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-434/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/146=
9">Intel XE#1469</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12694/shard-bmg-8/igt@kms_frontbuffer_tracki=
ng@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +44 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2694/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/sha=
rd-lnl-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#44=
72</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
694/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324=
">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12694/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380=
">Intel XE#3380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694=
/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4=
471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2694/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/shard=
-lnl-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2861">Intel XE#2861</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12694/sha=
rd-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">=
Intel XE#2893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12694/shard-lnl-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel=
 XE#1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12694/shard-lnl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel =
XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#11=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
694/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12694/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12694/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">=
Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_rotation_crc@primary-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4471">Intel XE#4471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12694/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-refl=
ect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12694/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12694/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-re=
flect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12694/shard-lnl-7/igt@kms_rotation_crc@prim=
ary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Inte=
l XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12694/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Inte=
l XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel X=
E#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12694/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1=
499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12694/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8257 -&gt; IGTPW_12694</li>
<li>Linux: xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d -&gt; xe-2752-1=
cf56e26a93292ca26fbf891368b75a67e8700dc</li>
</ul>
<p>IGTPW_12694: 12694<br />
  IGT_8257: 8257<br />
  xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d: 413ae464b8021542ad90cb1=
fbb15f8efc5050a5d<br />
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf89=
1368b75a67e8700dc</p>

</body>
</html>

--===============6459933091140148033==--
