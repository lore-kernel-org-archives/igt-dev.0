Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B79CAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 08:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229F10E0DF;
	Fri,  3 Oct 2025 08:43:37 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D9810E0DF;
 Fri,  3 Oct 2025 08:43:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7582727010129691191=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fcompute?=
 =?utf-8?q?=5Fpreempt=3A_Compute_preemption_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Oct 2025 08:43:36 -0000
Message-ID: <175948101635.2278.3023602643001292913@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251003052640.56068-1-sobin.thomas@intel.com>
In-Reply-To: <20251003052640.56068-1-sobin.thomas@intel.com>
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

--===============7582727010129691191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute_preempt: Compute preemption check
URL   : https://patchwork.freedesktop.org/series/155359/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8572_FULL -> XEIGTPW_13856_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13856_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13856_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13856_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html

  
#### Warnings ####

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [FAIL][3] ([Intel XE#5890]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_compute_preempt@compute-preempt-many-vram-evict}:
    - shard-dg2-set2:     [FAIL][7] ([Intel XE#5890]) -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13856_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#6054]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#5993]) +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2328])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#607])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2191])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2669]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#3432]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3432])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +12 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +111 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2724])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#4417]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#306]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2341]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#1178]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#3278])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1188])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2321])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2291]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2244])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4422])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#701])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1138])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1138])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2316]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1421]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1401] / [Intel XE#1745])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1397] / [Intel XE#1745])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1397])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#651]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#651]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#656]) +13 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#5390]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2312]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#5427])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2311]) +20 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2313]) +21 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653]) +9 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#1503])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-5/igt@kms_hdr@static-swap.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [FAIL][86] ([Intel XE#5195]) +2 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#4596])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2685] / [Intel XE#3307])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#2763]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2763]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#718])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#908])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][94] ([Intel XE#2029])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1406] / [Intel XE#2387])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1406]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1406] / [Intel XE#4609])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@kms_psr@psr2-primary-render.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#2234])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2330])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1435])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#4459]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1499]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#5626])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#4837]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4837]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#4837]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#688]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2322]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1392])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1392]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#288]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][122] ([Intel XE#3876])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4943]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#4915]) +74 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-stride-mmap-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-multi-fault:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][125] ([Intel XE#2594])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4943]) +15 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-huge.html

  * igt@xe_exec_threads@threads-mixed-userptr-rebind:
    - shard-bmg:          [PASS][127] -> [DMESG-FAIL][128] ([Intel XE#3876])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-2/igt@xe_exec_threads@threads-mixed-userptr-rebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_exec_threads@threads-mixed-userptr-rebind.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#2229])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2229])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#586])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2457])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#3573]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-464/igt@xe_oa@mi-rpc.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2427])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2284])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2284] / [Intel XE#366])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2284] / [Intel XE#366])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][138] -> [FAIL][139] ([Intel XE#4819]) +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4733]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#4733])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          NOTRUN -> [FAIL][142] ([Intel XE#5937]) +1 other test fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-lnl:          [ABORT][143] ([Intel XE#4760]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][145] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][147] ([Intel XE#2291]) -> [PASS][148] +7 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     [INCOMPLETE][149] ([Intel XE#3226]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][151] ([Intel XE#2373]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][153] ([Intel XE#2316]) -> [PASS][154] +6 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][155] ([Intel XE#616]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][157] ([Intel XE#1406] / [Intel XE#4692]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1392]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * {igt@xe_exec_system_allocator@many-64k-new-prefetch}:
    - shard-lnl:          [CRASH][161] ([Intel XE#6192]) -> [PASS][162] +6 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-lnl-1/igt@xe_exec_system_allocator@many-64k-new-prefetch.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-new-prefetch.html

  * {igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch}:
    - shard-bmg:          [CRASH][163] ([Intel XE#6192]) -> [PASS][164] +12 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch.html

  * {igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch}:
    - shard-bmg:          [WARN][165] ([Intel XE#5786]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][167] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][168] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][169] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][170] ([Intel XE#1727] / [Intel XE#3113] / [i915#14968])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][171] ([Intel XE#2341]) -> [FAIL][172] ([Intel XE#1178])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_content_protection@legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#2311]) +11 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][175] ([Intel XE#2311]) -> [SKIP][176] ([Intel XE#2312]) +12 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][177] ([Intel XE#5390]) -> [SKIP][178] ([Intel XE#2312]) +7 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][179] ([Intel XE#2312]) -> [SKIP][180] ([Intel XE#5390]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][181] ([Intel XE#2312]) -> [SKIP][182] ([Intel XE#2313]) +14 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][183] ([Intel XE#2313]) -> [SKIP][184] ([Intel XE#2312]) +11 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][185] ([Intel XE#4596]) -> [SKIP][186] ([Intel XE#5021])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#362]) -> [FAIL][188] ([Intel XE#1729])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8572/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * IGT: IGT_8572 -> IGTPW_13856
  * Linux: xe-3858-591ba5707c230e4a62c634450ce492118fe25948 -> xe-3861-2f24a052341862b0f13a2016d2b8afc7be4bf64f

  IGTPW_13856: 2b6c459a67e85eb724912faf8a0d3ed4e0b870c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8572: 8572
  xe-3858-591ba5707c230e4a62c634450ce492118fe25948: 591ba5707c230e4a62c634450ce492118fe25948
  xe-3861-2f24a052341862b0f13a2016d2b8afc7be4bf64f: 2f24a052341862b0f13a2016d2b8afc7be4bf64f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/index.html

--===============7582727010129691191==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute_preempt: Compute pree=
mption check</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155359/">https://patchwork.freedesktop.org/series/155359/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13856/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13856/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8572_FULL -&gt; XEIGTPW_13856_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13856_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13856_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
856_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-basi=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13856/shard-bmg-6/igt@xe_exec_balancer@many-execqueues-cm-virtual-ba=
sic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
90">Intel XE#5890</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13856/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-man=
y.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@xe_compute_preempt@=
compute-threadgroup-preempt.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_compute_preempt@compute-preempt-many-vram-evict}:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-vram-e=
vict.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5890">Intel XE#5890</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@xe_compute_preempt@compute-=
preempt-many-vram-evict.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13856_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-2/igt@kms_async_flips@asyn=
c-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#=
6054</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_async_flips@async-flip-=
with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13856/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_bw@linear-tiling-3-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe=
-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@kms_chamelium_color@ctm-green-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
6">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-a=
fter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-2/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_content_protection@legacy@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_content_protection@srm.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_content_protection@uevent@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256=
x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3856/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Inte=
l XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/sh=
ard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@kms_flip@2x-plain-flip-ts-check.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shar=
d-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"=
>Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 o=
ther tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Int=
el XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests =
skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-5/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@k=
ms_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@kms_plane@pixel-format-source-cl=
amping@pipe-a-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2685">Intel XE#2685</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">In=
tel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#=
4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4=
608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@kms_psr@psr2-primary-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</l=
i>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-8=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-434/igt@xe_eu_stall@unprivileged-acces=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@xe_eudebug@basic-connect.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@xe_eudebug_online@interrupt-othe=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@xe_eudebug_online@writes-cachi=
ng-sram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13856/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@xe_exec_fault_mode@many-execqu=
eues-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@xe_exec_system_allocator@threads=
-many-large-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@xe_exec_system_allocator@threa=
ds-many-stride-mmap-shared.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +74 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-multi-=
fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-436/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-stride-malloc-multi-fault.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_exec_system_allocator@twice-m=
map-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4943">Intel XE#4943</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-2/igt@xe_exec_threads@threads-mixed-userptr-rebind.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13856/shard-bmg-6/igt@xe_exec_threads@threads-mixed-userptr-rebind.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_=
kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migra=
te_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
57">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-464/igt@xe_oa@mi-rpc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel X=
E#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@xe_peer2peer@read.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Inte=
l XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-lnl-3/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-434/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-dg2-432/i=
gt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rende=
rcopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-dg2-463/igt@xe_pxp@pxp-src-to-pxp-dest-ren=
dercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5937">Intel XE#5937</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-0.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel=
 XE#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13856/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2560x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@kms_cursor_lega=
cy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +7 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13856/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-=
cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13856/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1385=
6/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +6 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13856/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a=
-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-lnl-4/igt@kms_psr_stress_t=
est@invalidate-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13856/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexec=
queue.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-new-prefetch}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-lnl-1/igt@xe_exec_system_allocator@many-64k-new-prefetch.h=
tml">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6192">Intel XE#6192</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13856/shard-lnl-8/igt@xe_exec_system_allocator@many-64k-=
new-prefetch.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-large-execqueues-new-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-n=
ew-prefetch.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-4/igt@xe_exec_system_alloca=
tor@many-large-execqueues-new-prefetch.html">PASS</a> +12 other tests pass<=
/li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues=
-mmap-prefetch.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5786">Intel XE#5786</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-2/igt@xe_exec_system_allo=
cator@threads-many-execqueues-mmap-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel =
XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13856/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13856/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968">i915#14=
968</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13856/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-1/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13856/shard-bmg-6/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13856/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5=
021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8572/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13856/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8572 -&gt; IGTPW_13856</li>
<li>Linux: xe-3858-591ba5707c230e4a62c634450ce492118fe25948 -&gt; xe-3861-2=
f24a052341862b0f13a2016d2b8afc7be4bf64f</li>
</ul>
<p>IGTPW_13856: 2b6c459a67e85eb724912faf8a0d3ed4e0b870c0 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8572: 8572<br />
  xe-3858-591ba5707c230e4a62c634450ce492118fe25948: 591ba5707c230e4a62c6344=
50ce492118fe25948<br />
  xe-3861-2f24a052341862b0f13a2016d2b8afc7be4bf64f: 2f24a052341862b0f13a201=
6d2b8afc7be4bf64f</p>

</body>
</html>

--===============7582727010129691191==--
